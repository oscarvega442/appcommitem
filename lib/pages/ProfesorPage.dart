import 'package:flutter/material.dart';

class Profesor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text ('Pagina Profesor'),),
      body: new Column(
        children: <Widget>[
          new Text ('Estamos en Page Profesor'),
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