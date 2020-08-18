import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ui_challege/week_3/widgets.dart';

class ProductPage extends StatefulWidget {
  final Map product;
  const ProductPage({this.product, Key key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool _liked = false;
  final List _quantities = ["50 ml", "100 ml", "150 ml"];
  var _selectedQ = "50 ml";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.9), Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Flexible(
                flex: 5,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: double.infinity,
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 90),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          widget.product['image'],
                          fit: BoxFit.fitHeight,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 40, sigmaY: 10),
                      child: Container(
                        height: double.infinity,
                        margin: const EdgeInsets.fromLTRB(20, 10, 20, 90),
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Hero(
                        tag: widget.product['image'],
                        child: Image.asset(
                          widget.product['image'],
                          fit: BoxFit.fitHeight,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 90),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white60,
                            ),
                          ),
                          IconButton(
                            onPressed: () => setState(() => _liked = !_liked),
                            icon: !_liked 
                            ? Icon(
                              Icons.favorite_border,
                              color: Colors.white60,
                            )
                            : Icon(
                              Icons.favorite,
                              color: Colors.redAccent.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 7,
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        widget.product['name'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        widget.product['by'],
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "A COVID-19 vaccine manufacturing plant\n of the institute in "+
                        "Kunming, capital city\n Yunnan Province, will be put into use in"+
                        " the\n second half of 2020",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 17,
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Divider(
                            color: Colors.white70, 
                            indent: 30,
                            endIndent: 30,
                          ),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width*0.45,
                            color: Color(0xFF060606),
                            child: Center(
                              child: Text(
                                widget.product['price'],
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _quantities.map((text) {
                            return TopChip(
                              clicked: text == _selectedQ,
                              onClick: () => setState(() => _selectedQ = text),
                              text: text,
                              paddingX: 15.0,
                            );
                          }).toList(),
                        ),
                      ),
                      QuantitySelector(),
                      Container(
                        height: 55,
                        margin: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_shopping_cart,
                              size: 28,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Add to Cart",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}