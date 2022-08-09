import 'package:flutter/material.dart';
import 'views/v1.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class pagopagina extends StatefulWidget {
  pagopagina({Key? key}) : super(key: key);
  @override
  State<pagopagina> createState() => _pagopaginaState();
}

class _pagopaginaState extends State<pagopagina> {
  List<v1> data = <v1>[];
  Future<List<v1>> tomar_datos() async {
    var url = "https://appfrutitas.000webhostapp.com/productos.php";
    var response =
        await http.post(Uri.parse(url)).timeout(const Duration(seconds: 90));
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
        appBar: AppBar(
          title: const Text(
            'Pedidos realizados',
          ),
          backgroundColor: Color(0xffF02E65),
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
                          Image.asset('assets/images/com.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.fill), // <-- SEE HERE
                        ],
                      ),
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Text(data[index].producto,
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[800]))),
                      Center(
                          child: Text(data[index].precio,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[800]))),
                      TextButton(
                          onPressed: () {},
                          child: Text(data[index].cantidad,
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
