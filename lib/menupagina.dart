import 'package:flutter/material.dart';
import 'package:appfrutitas/detail.dart';

class MenuPagina extends StatelessWidget {
  static String tag = 'menupagina';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 252, 248),
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          SizedBox(height: 60.0),
          Text('Productos disponibles',
              style: TextStyle(
                  fontFamily: 'test',
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 15.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 50.0,
                mainAxisSpacing: 1.0,
                childAspectRatio: 0.9,
                children: <Widget>[
                  _buildCard('Manzana', '\$3.99', 'assets/images/maa.png',
                      false, false, context),
                  _buildCard('Pera', '\$4.00', 'assets/images/pe.png', false,
                      true, context),
                  _buildCard('cebolla', '\$4.00', 'assets/images/ce.jpg', false,
                      true, context),
                  _buildCard('cilantro', '\$4.00', 'assets/images/ci.jpg',
                      false, true, context),
                  _buildCard('naranja', '\$4.00', 'assets/images/na.jpg', false,
                      true, context),
                  _buildCard('jugo de piña', '\$4.00', 'assets/images/pi.jpeg',
                      false, true, context),
                  _buildCard('Cocktel de frutas', '\$4.00',
                      'assets/images/co.png', false, true, context),
                  _buildCard('sandia', '\$4.00', 'assets/images/sa.jpg', false,
                      true, context),
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CookieDetail(
                      assetPath: imgPath,
                      cookieprice: price,
                      cookiename: name)));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            isFavorite
                                ? Icon(Icons.favorite,
                                    color: Color.fromARGB(255, 206, 22, 9))
                                : Icon(Icons.favorite_border,
                                    color: Color.fromARGB(255, 206, 22, 9))
                          ])),
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 95.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 9.0),
                  Text(price,
                      style: TextStyle(
                          color: Color(0xFFCC8053),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(name,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (!added) ...[
                              Icon(Icons.shopping_basket,
                                  color: Color(0xFFD17E50), size: 12.0),
                              Text('Add to cart',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFD17E50),
                                      fontSize: 12.0))
                            ],
                            if (added) ...[
                              Icon(Icons.remove_circle_outline,
                                  color: Color(0xFFD17E50), size: 12.0),
                              Text('3',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFD17E50),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0)),
                              Icon(Icons.add_circle_outline,
                                  color: Color(0xFFD17E50), size: 12.0),
                            ]
                          ]))
                ]))));
  }
}
