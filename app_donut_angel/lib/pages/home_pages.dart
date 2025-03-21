import 'package:app_donut_angel/models/product.dart';
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

  // Estado del carrito
  List<Product> cartItems = [];
  double totalPrice = 0.0;

  // Método para agregar un producto al carrito
  void addToCart(Product product) {
    setState(() {
      cartItems.add(product);
      totalPrice += product.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.menu, color: Colors.grey[800]), // Icono izquierdo
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person), // Icono derecho
            ),
          ],
        ),
        body: Column(
          children: [
            // Texto principal
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Row(
                children: [
                  Text(
                    "Eaters",
                    style: TextStyle(
                      fontFamily: "Lexend",
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "App",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Pestañas (TabBar)
            TabBar(tabs: myTabs),

            // Contenido de pestañas (TabBarView)
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(addToCart: addToCart),
                  BurgerTab(addToCart: addToCart),
                  SmoothieTab(addToCart: addToCart),
                  PancakesTab(addToCart: addToCart),
                  PizzaTab(addToCart: addToCart),
                ],
              ),
            ),

            // Carrito (cart)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${cartItems.length} items | \$${totalPrice.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text("Delivery Charge Included"),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Aquí puedes agregar la lógica para mostrar el carrito
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "View Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
