import 'dart:ui';
import 'package:flutter/material.dart';
import './models/medicine.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15, right: 14),
          height: 3.5,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15, right: 6, top: 6),
          height: 3.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15, right: 24, top: 6),
          height: 3.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ],
    );
  }
}

class TileButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final bool clicked;
  final int popUpNum;
  const TileButton({this.clicked = false, this.icon, this.popUpNum, this.onPressed,  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: clicked ? Colors.yellow: Colors.white30,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: clicked ? Colors.black: Colors.white, size: 28),
          ),
          if (popUpNum != null) Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.yellowAccent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                "12",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FloatingBottomNavBar extends StatelessWidget {
  final List icons;
  final Function(int) onPressed;
  final int clicked;
  const FloatingBottomNavBar({
    this.icons,
    this.onPressed,
    this.clicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF373737).withOpacity(0.9),
        borderRadius: BorderRadius.circular(18),
      ),
      width: MediaQuery.of(context).size.width*0.8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: icons.map((icon) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            child: TileButton(
              onPressed: () => onPressed(icons.indexOf(icon)),
              icon: icon,
              popUpNum: icons.indexOf(icon) == icons.length-1 ? 12: null,
              clicked: icons.indexOf(icon) == clicked ? true: false,
            ),
          );
        }).toList(),
      ),
    );
  }
}


class TopChip extends StatelessWidget {
  final bool clicked;
  final Function onClick;
  final String text;
  final double paddingX;
  const TopChip({this.clicked, this.onClick, this.text, this.paddingX, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: paddingX ?? 10.0, vertical: 10.0),
        height: 60,
        decoration: BoxDecoration(
          color: clicked ? Colors.white: Colors.white24,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: clicked ? Colors.black: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class BigItemCard extends StatefulWidget {
  final Product product;
  const BigItemCard({
    this.product,
    Key key,
  }) : super(key: key);

  @override
  _BigItemCardState createState() => _BigItemCardState();
}

class _BigItemCardState extends State<BigItemCard> {

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Container(
      margin: const EdgeInsets.all(4),
      height: MediaQuery.of(context).size.width*0.9,
      width: MediaQuery.of(context).size.width*0.6,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            height: MediaQuery.of(context).size.width*0.8,
            width: MediaQuery.of(context).size.width*0.6,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                SizedBox(height: 3),
                Text(
                  product.manufacture,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 16,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.price,
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 26,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Scaffold.of(context).removeCurrentSnackBar();
                        final _snackBar = SnackBar(
                          content: Text(
                            "${product.name} ${product.isInCart ? "removed from" :"added to"} your cart",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        );
                        Scaffold.of(context).showSnackBar(_snackBar);
                        setState(() {
                          product.isInCart ? 
                            product.removeFromCart()  
                            : product.addToCart();
                        });
                      },
                      child: TileButton(
                        clicked: true,
                        icon: product.isInCart ? 
                          Icons.remove_shopping_cart 
                          : Icons.add_shopping_cart,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: product.image+product.name,
              child: Image.asset(
                product.image,
                fit: BoxFit.fitHeight,
                height: MediaQuery.of(context).size.width*0.65,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SmallItemCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  const SmallItemCard({
    this.name,
    this.imageUrl,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: MediaQuery.of(context).size.width*0.508,
      width: MediaQuery.of(context).size.width*0.44,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            height: MediaQuery.of(context).size.width*0.42,
            width: MediaQuery.of(context).size.width*0.44,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fitHeight,
              height: MediaQuery.of(context).size.width*0.43,
            ),
          ),
        ],
      ),
    );
  }
}

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({Key key}) : super(key: key);

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => setState(() => _quantity <= 1 ? 1: _quantity--),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  "--",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: -10,
                    fontSize: 36,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 50,
            child: Center(
              child: Text(
                _quantity.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => _quantity++),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  "+",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SmallQuantitySelector extends StatefulWidget {
  const SmallQuantitySelector({Key key}) : super(key: key);

  @override
  _SmallQuantitySelectorState createState() => _SmallQuantitySelectorState();
}

class _SmallQuantitySelectorState extends State<SmallQuantitySelector> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      decoration: BoxDecoration(
        //color: Colors.white12,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => setState(() => _quantity <= 1 ? 1: _quantity--),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text(
                  "--",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: -10,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 30,
            width: 30,
            child: Center(
              child: Text(
                _quantity.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => _quantity++),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text(
                  "+",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final int count;
  final Product product;
  const CartItemCard({this.count, this.product, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        // color: Colors.white12,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  product.image,
                  alignment: Alignment.center,
                  fit: BoxFit.fitHeight,
                  height: MediaQuery.of(context).size.width*0.4,
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 15),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.yellow,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: product.price),
                          TextSpan(
                            text: " x 8 = ", 
                            style: TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.w300
                            )
                          ),
                          TextSpan(
                            text: "\$"+(double.parse(product.price.substring(1))*8).toString(),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    SmallQuantitySelector(),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.info_outline_rounded,
                  color: Colors.white70,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.remove_shopping_cart_outlined,
                  color: Colors.white70,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
