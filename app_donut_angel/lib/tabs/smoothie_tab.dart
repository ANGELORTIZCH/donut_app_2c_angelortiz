import 'package:flutter/material.dart';
import 'package:app_donut_angel/utils/donut_tile.dart';

class SmoothieTab extends StatelessWidget {
  //Lista de donas
  final List donutsOnSale = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    [
      "Ice Cream",
      "Krispy Kreme",
      "36",
      Colors.blue,
      "lib/images/icecream_donut.png"
    ],
    [
      "Strawberry",
      "Dunkin Donuts",
      "45",
      Colors.red,
      "lib/images/strawberry_donut.png"
    ],
    [
      "Grape Ape",
      "El Globo",
      "84",
      Colors.purple,
      "lib/images/grape_donut.png"
    ],
    [
      "Choco",
      "Starbucks",
      "95",
      Colors.brown,
      "lib/images/chocolate_donut.png"
    ],
    ["Choco", "Starbucks", "95", Colors.pink, "lib/images/chocolate_donut.png"],
    [
      "Choco",
      "Starbucks",
      "95",
      Colors.lightBlue,
      "lib/images/chocolate_donut.png"
    ],
    [
      "Choco",
      "Starbucks",
      "95",
      Colors.yellowAccent,
      "lib/images/chocolate_donut.png"
    ],
    [
      "Choco",
      "Starbucks",
      "95",
      Colors.orange,
      "lib/images/chocolate_donut.png"
    ],
  ];
  SmoothieTab({super.key});

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
          );
        });
  }
}
