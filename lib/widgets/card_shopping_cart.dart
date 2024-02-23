import 'package:flutter/material.dart';

class CardShoppingCart extends StatelessWidget {
  final String name;
  final double price;
  final int quantity;
  final String sugar;
  final String size;
  final VoidCallback? onRemove;

  const CardShoppingCart({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    this.onRemove,
    required this.sugar,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sugar: $sugar Size: $size'),
            Text('Price: \$ ${price.toStringAsFixed(2)}\nQuantity: $quantity'),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onRemove,
        ),
      ),
    );
  }
}
