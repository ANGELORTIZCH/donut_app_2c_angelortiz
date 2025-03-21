import 'package:app_donut_angel/models/product.dart';
import 'package:flutter/material.dart';
import 'package:app_donut_angel/utils/donut_tile.dart';

class PancakesTab extends StatelessWidget {
  final Function(Product) addToCart;
  //Lista de donas
  final List pancakeOnSale = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    [
      "Traditional",
      "Best Seller",
      "89",
      Colors.blue,
      "lib/images/pancake1.png"
    ],
    [
      "ChocoWaffle",
      "Best Seller",
      "49",
      Colors.blue,
      "lib/images/pancake2.png"
    ],
    [
      "Vanilla Waffle",
      "Best Seller",
      "89",
      Colors.blue,
      "lib/images/pancake3.png"
    ],
    [
      "Nutella Waffle",
      "Best Seller",
      "99",
      Colors.blue,
      "lib/images/pancake4.png"
    ],
    [
      "Fudge Waffle",
      "Best Seller",
      "95",
      Colors.blue,
      "lib/images/pancake5.png"
    ],
    [
      "Cloud Waffle",
      "Best Seller",
      "95",
      Colors.blue,
      "lib/images/pancake6.png"
    ],
    [
      "Fruit Waffle",
      "Best Seller",
      "95",
      Colors.blue,
      "lib/images/pancake7.png"
    ],
    ["Buttermilk", "Best Seller", "95", Colors.blue, "lib/images/pancake8.png"],
  ];
  PancakesTab({super.key, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    //Widget para usar cuadrícula
    return GridView.builder(
        //Cuántos elementos hay
        itemCount: pancakeOnSale.length,
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
              donutFlavor: pancakeOnSale[index][0],
              donutName: pancakeOnSale[index][1],
              donutPrice: pancakeOnSale[index][2],
              donutColor: pancakeOnSale[index][3],
              imageName: pancakeOnSale[index][4],
              onAddToCart: () {
                double price = double.parse(pancakeOnSale[index][2]);
                addToCart(Product(
                  name: pancakeOnSale[index][0],
                  price: price,
                ));
              });
        });
  }
}
