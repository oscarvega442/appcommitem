import 'package:flutter/material.dart';

class Coordinador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Pagina Coordinador'),
      ),
      body: new Column(
        children: <Widget>[
          new Text('Estamos en Page Coordeinador'),
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
