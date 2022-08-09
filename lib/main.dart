import 'dart:math';

import 'package:appfrutitas/inicio_page.dart';
import 'maps_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'pagopagina.dart';
import 'menupagina.dart';
import 'perfilpagina.dart';

void main() /*async */ {
  //async
  /* WidgetsFlutterBinding.ensureInitialized();//este
  await Firebase.initializeApp();*/ //este
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: InicioPage()));
}

class MiPagina extends StatefulWidget {
  @override
  State<MiPagina> createState() => _MiPaginaState();
}

class _MiPaginaState extends State<MiPagina> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;
  final screens = [
    MenuPagina(),
    MapsPage(),
    pagopagina(),
    perfilpagina(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.store, size: 30),
      Icon(Icons.map, size: 30),
      Icon(Icons.money, size: 30),
      Icon(Icons.person, size: 30),
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 231, 231),
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Color.fromARGB(255, 7, 201, 226)),
        ),
        child: CurvedNavigationBar(
          key: navigationKey,
          color: Color.fromARGB(255, 10, 15, 4),
          backgroundColor: Color.fromARGB(249, 244, 255, 255),
          height: 60,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          index: index,
          items: items,
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
