import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Estudiante extends StatefulWidget {
  @override
  _EstudianteState createState() => _EstudianteState();
}

class _EstudianteState extends State<Estudiante> {
  List _dataEstudiante = List();

  void _ambilData() async {
    final res = await http.post(
      Uri.parse(
          "https://commitem.000webhostapp.com/appcommitem/consultarEstudiante.php"),
    );
    setState(() {
      _dataEstudiante = json.decode(res.body);
    });
  }

  @override
  void initState() {
    _ambilData();
    super.initState();
  }

  SingleChildScrollView _tabelEstudiante() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            columns: [
              DataColumn(label: Text("Carnet")),
              DataColumn(label: Text("Proyecto")),
              DataColumn(label: Text("Nombre")),
              DataColumn(label: Text("Apellido1")),
              DataColumn(label: Text("Apellido2")),
              DataColumn(label: Text("Telefono")),
              DataColumn(label: Text("Correo")),
              DataColumn(label: Text("Carrera")),
              DataColumn(label: Text("Horas")),
              DataColumn(label: Text("Estado")),
            ],
            rows: _dataEstudiante
                .map((item) => DataRow(cells: <DataCell>[
                      DataCell(Text(item["estudianteTCU_carne"])),
                      DataCell(Text(item["proyectoTCU_id"])),
                      DataCell(Text(item["estudianteTCU_nombre"])),
                      DataCell(Text(item["estudianteTCU_apellido1"])),
                      DataCell(Text(item["estudianteTCU_apellido2"])),
                      DataCell(Text(item["estudianteTCU_tel"])),
                      DataCell(Text(item["estudianteTCU_correoIns"])),
                      DataCell(Text(item["estudianteTCU_carrera"])),
                      DataCell(Text(item["estudianteTCU_totalHoras"])),
                      DataCell(Text(item["estudianteTCU_estado"])),
                    ]))
                .toList()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Estudiante"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        child: ListView(children: <Widget>[
          Text(
            "Datos del Estudiante",
            style: TextStyle(fontSize: 19),
          ),
          SizedBox(
            height: 15,
          ),
          _tabelEstudiante(),
          FlatButton(
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/ActividadesPage');
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)),
            color: Colors.blue[700],
            child: Text("Actividades", style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),),),
          FloatingActionButton(
            child: Icon(Icons.backspace),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/loginPage');
            },
          )
        ]),
      ),
    );
  }
}
