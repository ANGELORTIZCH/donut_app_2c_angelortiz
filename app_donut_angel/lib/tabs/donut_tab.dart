import 'package:app_donut_angel/models/product.dart';
import 'package:app_donut_angel/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  final Function(Product) addToCart;
  //Lista de donas
  final List donutsOnSale = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    ["Original", "Best Seller", "39", Colors.blue, "lib/images/dona1.png"],
    ["Party Donut", "Best Seller", "49", Colors.red, "lib/images/dona2.png"],
    [
      "Strawberry Donut",
      "Best Seller",
      "59",
      Colors.purple,
      "lib/images/dona3.png"
    ],
    ["Nut Donut", "Best Seller", "69", Colors.brown, "lib/images/dona4.png"],
    ["Snow Donut", "Best Seller", "79", Colors.brown, "lib/images/dona5.png"],
    ["Pinky Donut", "Best Seller", "79", Colors.pink, "lib/images/dona6.png"],
    ["Glassed Donut", "Best Seller", "59", Colors.grey, "lib/images/dona7.png"],
    ["Donut Set", "Best Seller", "59", Colors.orange, "lib/images/dona8.png"],
  ];
  DonutTab({super.key, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    //Widget para usar cuadrícula
    return GridView.builder(
        //Cuántos elementos hay
        itemCount: donutsOnSale.length,
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
              donutFlavor: donutsOnSale[index][0],
              donutName: donutsOnSale[index][1],
              donutPrice: donutsOnSale[index][2],
              donutColor: donutsOnSale[index][3],
              imageName: donutsOnSale[index][4],
              onAddToCart: () {
                double price = double.parse(donutsOnSale[index][2]);
                addToCart(Product(
                  name: donutsOnSale[index][0],
                  price: price,
                ));
              });
        });
  }
}
