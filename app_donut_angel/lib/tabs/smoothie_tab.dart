import 'package:app_donut_angel/models/product.dart';
import 'package:flutter/material.dart';
import 'package:app_donut_angel/utils/donut_tile.dart';

class SmoothieTab extends StatelessWidget {
  final Function(Product) addToCart;
  //Lista de donas
  final List smoothieOnSale = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    [
      "Caramel Frappe",
      "Best Seller",
      "89",
      Colors.blue,
      "lib/images/frappe1.png"
    ],
    ["Candy Frappe", "Best Seller", "89", Colors.red, "lib/images/frappe2.png"],
    [
      "Choco Frappe",
      "Best Seller",
      "89",
      Colors.purple,
      "lib/images/frappe3.png"
    ],
    [
      "Matcha Frappe",
      "Best Seller",
      "99",
      Colors.brown,
      "lib/images/frappe4.png"
    ],
    [
      "Coffee Frappe",
      "Best Seller",
      "99",
      Colors.pink,
      "lib/images/frappe5.png"
    ],
    [
      "Cotton Frappe",
      "Best Seller",
      "89",
      Colors.lightBlue,
      "lib/images/frappe6.png"
    ],
    [
      "Nut Frappe",
      "Best Seller",
      "79",
      Colors.yellowAccent,
      "lib/images/frappe7.png"
    ],
    [
      "Fruit Frappe",
      "Best Seller",
      "89",
      Colors.orange,
      "lib/images/frappe8.png"
    ],
  ];
  SmoothieTab({super.key, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    //Widget para usar cuadrícula
    return GridView.builder(
        //Cuántos elementos hay
        itemCount: smoothieOnSale.length,
        padding: EdgeInsets.all(12),
        //cómo se distrubuirán los elementos
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //Cuántas columnas
          crossAxisCount: 2,
          //Relación de aspecto(proporción)
          childAspectRatio: 1 / 1.7,
        ),
        itemBuilder: (context, index) {
          return DonutTile(
              donutFlavor: smoothieOnSale[index][0],
              donutName: smoothieOnSale[index][1],
              donutPrice: smoothieOnSale[index][2],
              donutColor: smoothieOnSale[index][3],
              imageName: smoothieOnSale[index][4],
              onAddToCart: () {
                double price = double.parse(smoothieOnSale[index][2]);
                addToCart(Product(
                  name: smoothieOnSale[index][0],
                  price: price,
                ));
              });
        });
  }
}
