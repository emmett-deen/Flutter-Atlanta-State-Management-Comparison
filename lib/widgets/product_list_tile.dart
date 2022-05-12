import 'package:flutter/material.dart';
import 'package:flutter_atlanta_state_management_comparison/data/models/product.dart';

class ProductListTile extends StatelessWidget {
  final Product product;
  final int quantity;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  const ProductListTile(
      {Key? key,
      required this.product,
      required this.quantity,
      required this.onDecrement,
      required this.onIncrement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(product.title),
        subtitle: Text(product.priceToString()),
        trailing: SizedBox(
          width: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: onDecrement
              ),
              Text('$quantity'),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: onIncrement
              ),
            ],
          ),
        ));
  }
}
