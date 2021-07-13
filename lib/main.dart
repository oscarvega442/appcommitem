import 'package:commitem_proyect/pages/AdminPage.dart';
import 'package:commitem_proyect/pages/CoordinadorPage.dart';
import 'package:commitem_proyect/pages/EstudiantePage.dart';
import 'package:commitem_proyect/pages/ProfesorList.dart';
import 'package:commitem_proyect/pages/ProfesorPage.dart';
import 'package:commitem_proyect/pages/ProfesorRegister.dart';
import 'package:commitem_proyect/pages/ProyectoList.dart';
import 'package:commitem_proyect/pages/ProyectoRegister.dart';

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
        '/ProyectoList': (BuildContext context) => ProyectoList(),
        '/ProyectoRegister': (BuildContext context) => ProyectoRegister(),
        '/ProfesorList': (BuildContext context) => ProfesorList(),
        '/ProfesorRegister': (BuildContext context) =>  ProfesorRegister(),
        '/AdminPage': (BuildContext context) =>  Admin(),
        '/EstudiantePage': (BuildContext context) =>  Estudiante(),
        '/CoordinadorPage': (BuildContext context) =>  Coordinador(),
        '/ProfesorPage': (BuildContext context) =>  Profesor(),
        '/loginPage': (BuildContext context) => LoginScreen(),
      },
    );
  }
}
