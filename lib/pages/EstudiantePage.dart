import 'package:flutter/material.dart';

class Estudiante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text ('Pagina Estudiantes'),),
      body: new Column(
        children: <Widget>[
          new Text ('Estamos en Page Estudiante'),
            FloatingActionButton(
            child: Text("Salir"),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/loginPage');
            },
          )
        ],
      ),
    );
  }
}