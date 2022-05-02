import 'package:flutter/material.dart';
import '../models/medicine.dart';
import '../widgets.dart';

class CartView extends StatefulWidget {
  CartView({Key key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cart Items",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              Text(
                "Clear all",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: itemList.map((item) {
            return CartItemCard(count:itemList.indexOf(item)+1, product: item);
          }).toList(),
        ),
      ],
    );
  }
}
