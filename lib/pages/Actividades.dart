import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Actividades extends StatefulWidget {
  @override
  _ActividadesState createState() => _ActividadesState();
}

class _ActividadesState extends State<Actividades> {
  List datalist;

  Future<List> _register() async {
    final response = await http.post(Uri.parse(
        "https://commitem.000webhostapp.com/appcommitem/consultarActividades.php"));

    this.setState(() {
      datalist = json.decode(response.body);
    });

    return datalist;
  }

  @override
  void initState() {
    this._register();
  }

  SingleChildScrollView _tabelActividad() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
        child: DataTable(
            columns: [
              DataColumn(label: Text("Actividad")),
              DataColumn(label: Text("Carnet")),
              DataColumn(label: Text("Proyecto")),
              DataColumn(label: Text("Fecha")),
              DataColumn(label: Text("Lugar")),
              DataColumn(label: Text("Descripción")),
              DataColumn(label: Text("Horas")),
              DataColumn(label: Text("Estado")),
            ],
            rows: datalist.map((item) => DataRow(cells: <DataCell>[
              DataCell(Text(item["actividadTCU_id"])),
              DataCell(Text(item["estudianteTCU_carne"])),
              DataCell(Text(item["proyectoTCU_id"])),
              DataCell(Text(item["actividadTCU_fecha"])),
              DataCell(Text(item["actividadTCU_lugar"])),
              DataCell(Text(item["actividadTCU_descripcion"])),
              DataCell(Text(item["actividadTCU_cantidadHoras"])),
              DataCell(Text(item["actividadTCU_estado"])),

            ])).toList()
          ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Actividades"),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/EstudiantePage');
                }),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            Text("Tabla de actividades", style: TextStyle(fontSize: 19),),
            SizedBox(height: 15,),
            _tabelActividad(),
            FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/insertarActividad');
            },
          )
          ]),
      ),
    );
  }
}