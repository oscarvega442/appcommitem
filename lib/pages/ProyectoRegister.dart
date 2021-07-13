import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:commitem_proyect/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ProyectoRegister extends StatefulWidget {
  @override
  _ProyectoPageState createState() => _ProyectoPageState();
}

class _ProyectoPageState extends State<ProyectoRegister> {
  final _formKey = GlobalKey<FormState>();
  final _id = TextEditingController();
  final _coordinacionId = TextEditingController();
  final _profesorId = TextEditingController();
  final _nombre = TextEditingController();
  final _lugar = TextEditingController();
  final _descripcion = TextEditingController();
  final _horas = TextEditingController();

  Future<List> _register() async {
    final response = await http.post(
        Uri.parse(
            "https://commitem.000webhostapp.com/appcommitem/registerProyect.php"),
        body: {
          "_id": _id.text,
          "_coordinacionId": _coordinacionId.text,
          "_profesorId": _profesorId.text,
          "_nombre": _nombre.text,
          "_lugar": _lugar.text,
          "_descripcion": _descripcion.text,
          "_horas": _horas.text,
        });

    var datauser = json.decode(response.body);
    print(datauser);
    if (response.body.contains("Este nombre de usuario ya existe")) {
      Fluttertoast.showToast(
          msg: "Usuario no valido",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red.shade300,
          textColor: Colors.white,
          fontSize: 16.0);

      print("Este nombre de usuario ya existe ");
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

  Widget buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _id,
            decoration: InputDecoration(labelText: 'Sigla TCU'),
            // ignore: missing_return
            validator: (input) {
              if (input.isEmpty) {
                return 'Ingrese la sigla TCU';
              }
            },
          ),
          TextFormField(
            controller: _coordinacionId,
            decoration: InputDecoration(labelText: 'Coordinacion'),
            // ignore: missing_return
            validator: (input) {
              if (input.isEmpty) {
                return 'Ingrese el codigo de coordinacion';
              }
            },
          ),
          TextFormField(
            controller: _profesorId,
            decoration: InputDecoration(labelText: 'Profesor encargado'),
            // ignore: missing_return
            validator: (input) {
              if (input.isEmpty) {
                return 'Ingrese la cedula del profesor';
              }
            },
          ),
          TextFormField(
            controller: _nombre,
            decoration: InputDecoration(labelText: 'Nombre del proyecto'),
            // ignore: missing_return
            validator: (input) {
              if (input.isEmpty) {
                return 'Ingrese el nombre del proyecto';
              }
            },
          ),
          TextFormField(
            controller: _descripcion,
            decoration: InputDecoration(labelText: 'Descripcion del proyecto'),
            // ignore: missing_return
            validator: (input) {
              if (input.isEmpty) {
                return 'Ingrese la descripción';
              }
            },
          ),
          TextFormField(
            controller: _horas,
            decoration:
                InputDecoration(labelText: 'Horas respectivas al curso'),
            // ignore: missing_return
            validator: (input) {
              if (input.isEmpty) {
                return 'Ingrese las horas';
              }
            },
          ),
          RaisedButton(
            child: Text('Registrar'),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _register();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildContainer() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.only(left: 20, right: 20, top: 8),
          width: 330,
          height: 750,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 30,
                    spreadRadius: 5)
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildForm(),
            ],
          ),
        ),
      ],
    );
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
            child: ListView(
              children: <Widget>[
                buildContainer(),
                SizedBox(
                  height: 200,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
