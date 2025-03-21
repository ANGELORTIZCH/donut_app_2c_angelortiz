import 'package:flutter/material.dart';

class DonutTile extends StatefulWidget {
  final String donutFlavor;
  final String donutName;
  final String donutPrice;
  // Es dynamic porque será de tipo color
  final dynamic donutColor;
  final String imageName;
  final VoidCallback onAddToCart;

  const DonutTile({
    super.key,
    required this.donutFlavor,
    required this.donutName,
    required this.donutPrice,
    required this.donutColor,
    required this.imageName,
    required this.onAddToCart,
  });

  @override
  _DonutTileState createState() => _DonutTileState();
}

class _DonutTileState extends State<DonutTile> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
          color: widget.donutColor[50],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize
              .min, // Evita que la columna ocupe más espacio del necesario
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: widget.donutColor[100],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 18,
                  ),
                  child: Text(
                    '\$${widget.donutPrice}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: widget.donutColor[800],
                    ),
                  ),
                ),
              ],
            ),
            // Donut Picture
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: Image.asset(widget.imageName, fit: BoxFit.contain),
              ),
            ),
            // Donut Flavor Text
            Text(
              widget.donutFlavor,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 1),
            // Texto de la tienda
            Text(
              widget.donutName,
              style: const TextStyle(fontSize: 12),
            ),
            // Ícono de corazón + Botón Add
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite
                          ? Colors.red
                          : null, // Rojo si está relleno
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite =
                            !isFavorite; // Alterna entre favorito y no favorito
                      });
                    },
                  ),
                  GestureDetector(
                    onTap: widget.onAddToCart,
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
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
