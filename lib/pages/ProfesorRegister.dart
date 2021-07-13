import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:commitem_proyect/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ProfesorRegister extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<ProfesorRegister> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final cedulaController = TextEditingController();
  final apellido1Controller = TextEditingController();
  final apellido2Controller = TextEditingController();
  final correoController = TextEditingController();
  final telefonoController = TextEditingController();
  final unidadController = TextEditingController();
  final horarioController = TextEditingController();

  Future<List> _register() async {
    print(nameController.text);

    final response = await http.post(
        Uri.parse(
            "https://commitem.000webhostapp.com/appcommitem/registerProfesor.php"),
        body: {
          "_id": cedulaController.text,
          "_nombre": nameController.text,
          "_apellido1": apellido1Controller.text,
          "_apellido2": apellido2Controller.text,
          "_correo": correoController.text,
          "_tel": telefonoController.text,
          "_unidadAca": unidadController.text,
          "_horario": horarioController.text,
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
            controller: nameController,
            decoration: InputDecoration(labelText: 'Nombre'),
            // ignore: missing_return
            validator: (input) {
              if (input.isEmpty) {
                return 'Ingrese el nombre del profesor';
              }
            },
          ),
          TextFormField(
            controller: apellido1Controller,
            decoration: InputDecoration(labelText: 'Primer Apellido'),
            // ignore: missing_return
            validator: (input) {
              if (input.isEmpty) {
                return 'Ingrese el primer apellido del profesor';
              }
            },
          ),
          TextFormField(
            controller: apellido2Controller,
            decoration: InputDecoration(labelText: 'Segundo Apellido'),
            // ignore: missing_return
            validator: (input) {
              if (input.isEmpty) {
                return 'Ingrese el segundo apellido del profesor';
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
                return 'Ingrese la cedúla del profesor';
              }
            },
          ),
          TextFormField(
            controller: telefonoController,
            decoration: InputDecoration(labelText: 'Teléfono'),
            keyboardType: TextInputType.number,
            // ignore: missing_return
            validator: (input) {
              if (input.isEmpty) {
                return 'Ingrese el nombre del profesor';
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
                return 'Ingrese el correo institucional del profesor';
              }
            },
          ),
          TextFormField(
            controller: horarioController,
            decoration: InputDecoration(labelText: 'Horario de atención'),
            // ignore: missing_return
            validator: (input) {
              if (input.isEmpty) {
                return 'Ingrese el horario ';
              }
            },
          ),
          TextFormField(
            controller: unidadController,
            decoration: InputDecoration(labelText: 'Unidad academica'),
            // ignore: missing_return
            validator: (input) {
              if (input.isEmpty) {
                return 'Ingrese la unidad Academica ';
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
                    'Agregar Profesor',
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
