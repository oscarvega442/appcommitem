import 'dart:convert';
import 'package:commitem_proyect/pages/login_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:commitem_proyect/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ActualizarDatos extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<ActualizarDatos> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final apellido1Controller = TextEditingController();
  final apellido2Controller = TextEditingController();

  @override
  void initState() {
    this._get_admin();
  }

  Future<List> _update_Admin() async {
    final response = await http.post(
        Uri.parse(
            "https://commitem.000webhostapp.com/appcommitem/updateadmin.php"),
        body: {
          "_nombre": nameController.text,
          "_apellido1": apellido1Controller.text,
          "_apellido2": apellido2Controller.text,
          "_correo": correo,
        });

    var datauser = json.decode(response.body);
    print(datauser);
    if (datauser[0]['estado'] == "Usuario actualizado con Éxito") {
      Fluttertoast.showToast(
          msg: "Usuario actualizado con Éxito",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red.shade300,
          textColor: Colors.white,
          fontSize: 16.0);

      print("Usuario actualizado con Éxito ");
    } else {
      Fluttertoast.showToast(
          msg: "Hubo un error",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red.shade300,
          textColor: Colors.white,
          fontSize: 16.0);

      print("Hubo un error");
      setState(() {});
    }

    return datauser;
  }

  Future<List> _get_admin() async {
    var datalist;
    print(correo);
    final response = await http.post(
        Uri.parse(
            "https://commitem.000webhostapp.com/appcommitem/getadmin.php"),
        body: {
          "_correo": correo,
        });

    this.setState(() {
      print(response.body);
      datalist = json.decode(response.body);
    });
    nameController.text = datalist[0]['superAdmin_nombre'];
    apellido1Controller.text = datalist[0]['superAdmin_apellido1'];
    apellido2Controller.text = datalist[0]['superAdmin_apellido2'];
    return datalist;
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
                return 'Ingrese su nombre';
              }
            },
          ),
          TextFormField(
            controller: apellido1Controller,
            decoration: InputDecoration(labelText: 'Primer Apellido'),
            // ignore: missing_return
            validator: (input) {
              if (input.isEmpty) {
                return 'Ingrese esu primer apellido';
              }
            },
          ),
          TextFormField(
            controller: apellido2Controller,
            decoration: InputDecoration(labelText: 'Segundo Apellido'),
            // ignore: missing_return
            validator: (input) {
              if (input.isEmpty) {
                return 'Ingrese su segundo apellido';
              }
            },
          ),
          RaisedButton(
            child: Text('Registrar'),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _update_Admin();
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
                    'Actualizar datos',
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
          height: 400,
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
