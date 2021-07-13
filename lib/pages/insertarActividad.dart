import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InsertarActividad extends StatefulWidget {
  @override
  _InsertarActividadState createState() => _InsertarActividadState();
}

class _InsertarActividadState extends State<InsertarActividad> {
  TextEditingController controlCarnet = new TextEditingController();
  TextEditingController controlProyecto = new TextEditingController();
  TextEditingController controlFecha = new TextEditingController();
  TextEditingController controlLugar = new TextEditingController();
  TextEditingController controlDescrpcion = new TextEditingController();
  TextEditingController controlHoras = new TextEditingController();

  Future<List> agregarUsuario() async {
    final response = await http.post(
        Uri.parse(
            "https://commitem.000webhostapp.com/appcommitem/insertarActividad.php"),
        body: {
          "_carnet": controlCarnet.text,
          "_proyecto": controlProyecto.text,
          "_fecha": controlFecha.text,
          "_lugar": controlLugar.text,
          "_descripcion": controlDescrpcion.text,
          "_horas": controlHoras.text,
        });

    var datauser = json.decode(response.body);
    print(datauser);
    if (datauser.length == 0) {
      Fluttertoast.showToast(
          msg: "Actividad no valido",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red.shade300,
          textColor: Colors.white,
          fontSize: 16.0);

      print("Esta Actividad no es valida");
    } else {
      Fluttertoast.showToast(
          msg: "Registro con exito",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red.shade300,
          textColor: Colors.white,
          fontSize: 16.0);

      print("Registro con exito");
      setState(() {});
    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insertar Actividad"),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/ActividadesPage');
                }),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new TextField(
                controller: controlCarnet,
                decoration: new InputDecoration(labelText: "Carnet"),
              ),
              new TextField(
                controller: controlProyecto,
                decoration: new InputDecoration(labelText: "Proyecto"),
              ),
              new TextField(
                controller: controlFecha,
                decoration: new InputDecoration(labelText: "Fecha"),
              ),
              new TextField(
                controller: controlLugar,
                decoration: new InputDecoration(labelText: "Lugar"),
              ),
              new TextField(
                controller: controlDescrpcion,
                decoration: new InputDecoration(labelText: "Descrpcion"),
              ),
              new TextField(
                controller: controlHoras,
                decoration: new InputDecoration(labelText: "Horas"),
              ),
              new RaisedButton(
                child: new Text("Agregar"),
                onPressed: () {
                  agregarUsuario();
                  Navigator.pushReplacementNamed(context, '/ActividadesPage');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}