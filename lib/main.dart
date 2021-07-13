import 'package:commitem_proyect/pages/Actividades.dart';
import 'package:commitem_proyect/pages/AdminPage.dart';
import 'package:commitem_proyect/pages/CoordinadorPage.dart';
import 'package:commitem_proyect/pages/EstudiantePage.dart';
<<<<<<< HEAD
import 'package:commitem_proyect/pages/InsertarActividad.dart';
=======
import 'package:commitem_proyect/pages/ProfesorList.dart';
>>>>>>> 7d11193355470241a8534cc4fe12c1d3e8a1627f
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
        '/ActividadesPage': (BuildContext context) => Actividades(),
        '/insertarActividad': (BuildContext context) => InsertarActividad(),
      },
    );
  }
}
