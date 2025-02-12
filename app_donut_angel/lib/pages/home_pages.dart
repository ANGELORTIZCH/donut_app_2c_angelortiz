import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: const Column(
          children: [
            //texto principal
            Padding(
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
            )
          ],
        )
        //prestañas(TabBar)

        //Contenido de pestañas (TabBarView)

        //Carrito(cart)

        );
  }
}
