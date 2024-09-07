import 'package:flutter/material.dart';
import 'package:my_bag_assignment/cart.dart';

void main(){
  runApp(const ShoppingCart());
}

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Cart(),
    );
  }
}
