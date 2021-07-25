import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class EliminarCoordinador extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<EliminarCoordinador> {
  List datauser;

  @override
  void initState() {
    this._listcoordinador();
  }

  Future<List> _listcoordinador() async {
    final response = await http.post(Uri.parse(
        "https://commitem.000webhostapp.com/appcommitem/listcoordinador.php"));

    this.setState(() {
      datauser = json.decode(response.body);
    });

    return datauser;
  }

  Future<List> _deletecoordinador(String cedula) async {
    print(cedula);
    final response = await http.post(
        Uri.parse(
            "https://commitem.000webhostapp.com/appcommitem/eliminarcoordinador.php"),
        body: {
          "_id": cedula,
        });

    this.setState(() {
      datauser = json.decode(response.body);
    });
    print(datauser);
    if (datauser[0]["estado"] == "usuario Eliminado con exito") {
      Fluttertoast.showToast(
          msg: "Usuario Eliminado con exito",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red.shade300,
          textColor: Colors.white,
          fontSize: 16.0);

      print("Usuario Eliminado con exito");
    } else {
      Fluttertoast.showToast(
          msg: "Hubo un error",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red.shade300,
          textColor: Colors.white,
          fontSize: 16.0);

      print("Hubo un error");
    }
    return datauser;
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
              Navigator.pushReplacementNamed(context, '/AdminPage');
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
              itemCount: datauser == null ? 0 : datauser.length,
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
                                datauser[index]['NombreCompleto'],
                                //'Note Title',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                            ),
                            Text(
                              datauser[index]['correo'],
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
                                _deletecoordinador(
                                    datauser[index]['Identificador']);
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
