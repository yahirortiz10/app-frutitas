import 'package:appfrutitas/views/v2.dart';
import 'package:flutter/material.dart';
import 'views/v2.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class perfilpagina extends StatefulWidget {
  perfilpagina({Key? key}) : super(key: key);
  @override
  State<perfilpagina> createState() => _perfilpaginaState();
}

class _perfilpaginaState extends State<perfilpagina> {
  List<v2> data = <v2>[];
  Future<List<v2>> tomar_datos() async {
    var url = "https://appfrutitas.000webhostapp.com/usuarios.php";
    var response =
        await http.post(Uri.parse(url)).timeout(const Duration(seconds: 90));
    var datos = json.decode(response.body);
    var registros = <v2>[];
    for (datos in datos) {
      registros.add(v2.fromJson(datos));
    }
    return registros;
  }

  @override
  void initState() {
    super.initState();
    tomar_datos().then((value) {
      setState(() {
        data.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Usuarios inscritos'),
          actions: <Widget>[], //<Widget>[]
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Container(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.fromLTRB(15, 20, 15, 15),
                elevation: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Image.asset('assets/images/usu.jpg',
                              width: 150,
                              height: 150,
                              fit: BoxFit.fill), // <-- SEE HERE
                        ],
                      ),
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Text(data[index].cliente,
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[800]))),
                      Center(
                          child: Text(data[index].nombre,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[800]))),
                      TextButton(
                          onPressed: () {},
                          child: Text(data[index].telefono,
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.cyan[800],
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
