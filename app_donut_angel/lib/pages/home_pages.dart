import 'package:app_donut_angel/tabs/burger_tab.dart';
import 'package:app_donut_angel/tabs/donut_tab.dart';
import 'package:app_donut_angel/tabs/pancakes_tab.dart';
import 'package:app_donut_angel/tabs/pizza.tab.dart';
import 'package:app_donut_angel/tabs/smoothie_tab.dart';
import 'package:app_donut_angel/utils/my_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    const MyTab(iconPath: 'lib/icons/donut.png'),
    const MyTab(iconPath: 'lib/icons/burger.png'),
    const MyTab(iconPath: 'lib/icons/smoothie.png'),
    const MyTab(iconPath: 'lib/icons/pancakes.png'),
    const MyTab(iconPath: 'lib/icons/pizza.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          //icono izquierdo
          leading: Icon(Icons.menu, color: Colors.grey[800]), //icono derecho
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        body: Column(
          children: [
            //texto principal
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Row(
                children: [
                  Text("I want to ", style: TextStyle(fontSize: 32)),
                  Text(
                    "Eat",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                  SizedBox(width: 16),
                  Text("healthy"),
                ],
              ),
            ),
            //prestañas(TabBar)
            TabBar(tabs: myTabs),

            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(),
                  BurgerTab(),
                  SmoothieTab(),
                  PancakesTab(),
                  PizzaTab(),
                ],
              ),
            )
            //Contenido de pestañas (TabBarView)

            //Carrito(cart)
          ],
        ),
      ),
    );
  }
}
