import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String name;
  final double mass;
  final double volume;
  final String imageUrl;
  final Color color;
  const ProductPage({this.name, this.mass, this.volume, this.imageUrl, this.color, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            minimum: EdgeInsets.only(top: 30, bottom: 0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.close, size: 34, color: Colors.black.withOpacity(0.7)),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.white12,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Hero(
                    tag: "product",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Material(
                          color: Colors.white30,
                          child: IconButton(
                            icon: Icon(Icons.shopping_basket, size: 32, color: Colors.black.withOpacity(0.7)),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.white38,
                            onPressed: (){},
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Hero(
                        tag: imageUrl,
                        child: Image.network(
                          imageUrl,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (i) => Container(
                          height: 12, width: 12,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            color: i == 0 ? Colors.white: Colors.white54,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
                    child: Container(
                      color: Colors.white,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24, 40, 24, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bonye $name medium", 
                                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("$mass gm", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                     Text("$volume L.E", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.brown)),
                                  ],
                                ),
                                SizedBox(height: 15),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "product details\n", 
                                        style: TextStyle(fontSize: 17, color: Colors.grey),
                                      ),
                                      TextSpan(
                                        text: "rasberry is the edible fruit of a multitude of plant species in the genus Rebus of the rose family, most of which are in the subgenus Idaeobatus; the name also applies to these plants", 
                                        style: TextStyle(fontSize: 16, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Icon(Icons.directions_transit, color: Colors.grey, size: 30),
                                    Text(
                                      "\t\tDelivary Est.6/9/2020, 9am to 3pm", 
                                      style: TextStyle(fontSize: 16, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SafeArea(
                            top: false,
                            minimum: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0, right: 6),
                                    child: FlatButton(
                                      child: Text("Add to bag", style: TextStyle(fontSize: 22, color: Colors.white)),
                                      color: color,
                                      padding: const EdgeInsets.symmetric(vertical: 18),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.white12,
                                      focusColor: color.withOpacity(0.4),
                                      onPressed: (){},
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 6, right: 15.0),
                                    child: OutlineButton(
                                      child: Icon(Icons.favorite, size: 30, color: color),
                                      borderSide: BorderSide(color: color),
                                      highlightedBorderColor: color,
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.grey[50],
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      focusColor: color.withOpacity(0.2),
                                      padding: const EdgeInsets.symmetric(vertical: 16),
                                      color: color,
                                      onPressed: (){},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}