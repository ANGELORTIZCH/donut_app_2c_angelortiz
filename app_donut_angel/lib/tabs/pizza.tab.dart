import 'package:app_donut_angel/models/product.dart';
import 'package:flutter/material.dart';
import 'package:app_donut_angel/utils/donut_tile.dart';

class PizzaTab extends StatelessWidget {
  final Function(Product) addToCart;
  //Lista de donas
  final List pizzaOnSale = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    ["Margarita", "Best Seller", "199", Colors.brown, "lib/images/pizza1.png"],
    ["Hawaiian", "Best Seller", "189", Colors.brown, "lib/images/pizza2.png"],
    ["Pepperoni", "Best Seller", "199", Colors.brown, "lib/images/pizza3.png"],
    ["MeatLover", "Best Seller", "149", Colors.brown, "lib/images/pizza4.png"],
    ["Mushroom", "Best Seller", "189", Colors.brown, "lib/images/pizza5.png"],
    [
      "Veggie Bite",
      "Best Seller",
      "169",
      Colors.brown,
      "lib/images/pizza6.png"
    ],
    [
      "Tomato Pizza",
      "Best Seller",
      "159",
      Colors.brown,
      "lib/images/pizza7.png"
    ],
    [
      "Alfredo Taste",
      "Best Seller",
      "199",
      Colors.brown,
      "lib/images/pizza8.png"
    ],
  ];
  PizzaTab({super.key, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    //Widget para usar cuadrícula
    return GridView.builder(
        //Cuántos elementos hay
        itemCount: pizzaOnSale.length,
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
              donutFlavor: pizzaOnSale[index][0],
              donutName: pizzaOnSale[index][1],
              donutPrice: pizzaOnSale[index][2],
              donutColor: pizzaOnSale[index][3],
              imageName: pizzaOnSale[index][4],
              onAddToCart: () {
                double price = double.parse(pizzaOnSale[index][2]);
                addToCart(Product(
                  name: pizzaOnSale[index][0],
                  price: price,
                ));
              });
        });
  }
}
