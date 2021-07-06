import 'package:commitem_proyect/pages/AdminPage.dart';
import 'package:commitem_proyect/pages/CoordinadorPage.dart';
import 'package:commitem_proyect/pages/EstudiantePage.dart';
import 'package:commitem_proyect/pages/ProfesorPage.dart';
import 'package:flutter/material.dart';
import 'package:commitem_proyect/pages/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Commitem',
      home: LoginScreen(),
      routes: <String, WidgetBuilder>{
        '/AdminPage': (BuildContext context) => new Admin(),
        '/EstudiantePage': (BuildContext context) => new Estudiante(),
        '/CoordinadorPage': (BuildContext context) => new Coordinador(),
        '/ProfesorPage': (BuildContext context) => new Profesor(),
        '/loginPage': (BuildContext context) => LoginScreen(),
      },
    );
  }
}
