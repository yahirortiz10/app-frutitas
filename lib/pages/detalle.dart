import 'dart:developer';

import 'package:flutter/material.dart';

class Detalle extends StatefulWidget {
  final nombre;
  final precio;
  final imagen;

  const Detalle(
      {super.key,
      required this.nombre,
      required this.precio,
      required this.imagen});

  @override
  _DetalleState createState() => _DetalleState();
}

class _DetalleState extends State<Detalle> {
  int _counter = 0;
  int _total = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _desincrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _calcular() {
    var numero1 = widget.precio;
    int numero2 = _counter;
    int result = numero1 * numero2;

    setState(() {
      _total = result;
      print(_total);
    });
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(223, 19, 243, 150),
    );
  }
}
