import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ProyectoList extends StatefulWidget {
  @override
  _ListProyectPageState createState() => _ListProyectPageState();
}

class _ListProyectPageState extends State<ProyectoList> {
  List datalist;

  Future<List> _register() async {
    final response = await http.post(Uri.parse(
        "https://commitem.000webhostapp.com/appcommitem/listProyects.php"));

    this.setState(() {
      datalist = json.decode(response.body);
    });

    return datalist;
  }

  @override
  void initState() {
    this._register();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.subdirectory_arrow_left,
              size: 20,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/CoordinadorPage');
            }),
        title: Text('Commitem'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/loginPage');
                }),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: new ListView.builder(
              itemCount: datalist == null ? 0 : datalist.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 32, bottom: 32, left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            InkWell(
                              onTap: () {},
                              child: Text(
                                datalist[index]['proyectoTCU_nombre'],
                                //'Note Title',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                            ),
                            Text(
                              datalist[index]['proyectoTCU_id'],
                              //'Note Text',
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                        //SizedBox(width: 20),
                        Container(
                          height: 50,
                          width: 50,
                          child: IconButton(
                              icon: Icon(
                                Icons.delete,
                                size: 20,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/CoordinadorPage');
                              }),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
