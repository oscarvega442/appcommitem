import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:commitem_proyect/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class RegistroCoordinador extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<RegistroCoordinador> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final cedulaController = TextEditingController();
  final apellido1Controller = TextEditingController();
  final apellido2Controller = TextEditingController();
  final correoController = TextEditingController();

  Future<List> _register() async {
    final response = await http.post(
        Uri.parse(
            "https://commitem.000webhostapp.com/appcommitem/registercoordinador.php"),
        body: {
          "_id": cedulaController.text,
          "_nombre": nameController.text,
          "_apellido1": apellido1Controller.text,
          "_apellido2": apellido2Controller.text,
          "_correo": correoController.text,
        });

    var datauser = json.decode(response.body);
    print(datauser);
    if (datauser[0]['estado'] == "Usuario insertado con Éxito") {
      Fluttertoast.showToast(
          msg: "Usuario insertado con Éxito",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red.shade300,
          textColor: Colors.white,
          fontSize: 16.0);

      print("Usuario insertado con Éxito");
    } else {
      Fluttertoast.showToast(
          msg: "Usuario ya existe ",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red.shade300,
          textColor: Colors.white,
          fontSize: 16.0);

      print("Usuario ya existe");
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
            controller: nameController,
            decoration: InputDecoration(labelText: 'Nombre'),
            // ignore: missing_return
            validator: (input) {
              if (input.isEmpty) {
                return 'Ingrese el nombre del coordinador';
              }
            },
          ),
          TextFormField(
            controller: apellido1Controller,
            decoration: InputDecoration(labelText: 'Primer Apellido'),
            // ignore: missing_return
            validator: (input) {
              if (input.isEmpty) {
                return 'Ingrese el primer apellido del coordinador';
              }
            },
          ),
          TextFormField(
            controller: apellido2Controller,
            decoration: InputDecoration(labelText: 'Segundo Apellido'),
            // ignore: missing_return
            validator: (input) {
              if (input.isEmpty) {
                return 'Ingrese el segundo apellido del coordinador';
              }
            },
          ),
          TextFormField(
            controller: cedulaController,
            decoration: InputDecoration(labelText: 'Cedúla'),
            keyboardType: TextInputType.number,
            // ignore: missing_return
            validator: (input) {
              if (input.isEmpty) {
                return 'Ingrese la cedúla del coordinador';
              }
            },
          ),
          TextFormField(
            controller: correoController,
            decoration: InputDecoration(labelText: 'Correo Institucional'),
            keyboardType: TextInputType.emailAddress,
            // ignore: missing_return
            validator: (input) {
              if (input.isEmpty) {
                return 'Ingrese el correo institucional del coordinador';
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
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    'Agregar coordinador',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 20),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.only(left: 20, right: 20, top: 8),
          width: 330,
          height: 500,
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
