import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'views/v1.dart';

class conexionHTTP extends StatefulWidget {
  conexionHTTP({Key? key}) : super(key: key);

  @override
  State<conexionHTTP> createState() => _conexionHTTPState();
}

class _conexionHTTPState extends State<conexionHTTP> {
  List<v1> data = <v1>[];
  Future<List<v1>> tomar_datos() async {
    var url = "http://192.168.1.139/empleados.php";
    var response =
        await http.post(Uri.parse(url)).timeout(Duration(seconds: 90));
    var datos = json.decode(response.body);
    var registros = <v1>[];
    for (datos in datos) {
      registros.add(v1.fromJson(datos));
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
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Text(data[index].producto)),
                      Center(
                          child: Text(data[index].precio,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.cyan[800]))),
                      TextButton(
                          onPressed: () {},
                          child: Text(data[index].cantidad,
                              style: TextStyle(
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
