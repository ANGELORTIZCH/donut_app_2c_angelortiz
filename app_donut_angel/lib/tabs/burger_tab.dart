import 'package:app_donut_angel/models/product.dart';
import 'package:app_donut_angel/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
  final Function(Product) addToCart;
  //Lista de donas
  final List burgerOnSale = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    [
      "Chicken Burger",
      "Best Seller",
      "89",
      Colors.brown,
      "lib/images/burger1.png"
    ],
    [
      "Bacon Burger",
      "Best Seller",
      "45",
      Colors.brown,
      "lib/images/burger2.png"
    ],
    [
      "Classic Burger",
      "Best Seller",
      "84",
      Colors.brown,
      "lib/images/burger3.png"
    ],
    [
      "Double Burger",
      "Best Seller",
      "95",
      Colors.brown,
      "lib/images/burger4.png"
    ],
    [
      "Chunky Burger",
      "Best Seller",
      "99",
      Colors.brown,
      "lib/images/burger5.png"
    ],
    [
      "Krispy Burger",
      "Best Seller",
      "95",
      Colors.brown,
      "lib/images/burger6.png"
    ],
    [
      "Triple Burger",
      "Best Seller",
      "99",
      Colors.brown,
      "lib/images/burger7.png"
    ],
    [
      "Master Burger",
      "Best Seller",
      "95",
      Colors.brown,
      "lib/images/burger8.png"
    ],
  ];
  BurgerTab({super.key, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    //Widget para usar cuadrícula
    return GridView.builder(
        //Cuántos elementos hay
        itemCount: burgerOnSale.length,
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
              donutFlavor: burgerOnSale[index][0],
              donutName: burgerOnSale[index][1],
              donutPrice: burgerOnSale[index][2],
              donutColor: burgerOnSale[index][3],
              imageName: burgerOnSale[index][4],
              onAddToCart: () {
                double price = double.parse(burgerOnSale[index][2]);
                addToCart(Product(
                  name: burgerOnSale[index][0],
                  price: price,
                ));
              });
        });
  }
}
