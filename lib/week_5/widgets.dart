import 'package:flutter/material.dart';
import 'package:ui_challege/week_5/screens.dart';

class PromotionCard extends StatelessWidget {
  final String smallText;
  final String bigText;
  const PromotionCard({this.smallText, this.bigText, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: MediaQuery.of(context).size.width*0.44,
          height: MediaQuery.of(context).size.width*0.57,
          color: Colors.yellowAccent.withOpacity(0.25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "best Khodar offers",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -1,
                        ),
                      ),
                      TextSpan(
                        text: "\n50% Off",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1,
                        ),
                      ),
                    ],
                    style: TextStyle(height: 1.3),
                  ),
                ),
              ),
              FlatButton(
                child: Text("Best Offers", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.brown),
                  borderRadius: BorderRadius.circular(6),
                ),
                textColor: Colors.brown,
                color: Colors.white60,
                splashColor: Colors.white30,
                highlightColor: Colors.white10,
                onPressed: (){},
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0, top: 6),
                child: Center(
                  child: Icon(
                    Icons.fastfood,
                    size: 60,
                    color: Colors.brown,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FruitCard extends StatelessWidget {
  final Color color;
  final String name;
  final double mass;
  final double volume;
  final String imageUrl;
  const FruitCard({this.name, this.mass, this.volume, this.color, this.imageUrl, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductPage(
                name: name,
                mass: mass,
                volume: volume,
                color: color,
                imageUrl: imageUrl,
              ),
            )),
            highlightColor: Colors.transparent,
            splashColor: Colors.white54,
            child: Container(
              width: MediaQuery.of(context).size.width*0.44,
              height: MediaQuery.of(context).size.width*0.67,
              color: color.withOpacity(0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(15)),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 32,
                          color: Colors.brown,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Hero(
                        tag: imageUrl,
                        child: Image.network(
                          imageUrl,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: name,
                            style: TextStyle(
                              color: Colors.brown,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "\t\t${mass}Kg",
                            style: TextStyle(
                              color: Colors.brown,
                              fontSize: 17,
                            ),
                          ),
                          TextSpan(
                            text: "\n${volume}L.E",
                            style: TextStyle(
                              color: Colors.brown,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                        style: TextStyle(height: 1.3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: TextField(
        cursorWidth: 1,
        cursorColor: Color.fromRGBO(255, 178, 172, 1),
        style: TextStyle(fontSize: 19),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          fillColor: Colors.white,
          focusColor: Color.fromRGBO(255, 178, 172, 1),
          prefixIcon: Icon(Icons.search, color:  Color(0xFFCECECE)),
          labelText: "Search ...",
          labelStyle: TextStyle(color: Colors.grey),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFCECECE),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(255, 178, 172, 1),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Icon(Icons.store_mall_directory, color: Colors.white, size: 36),
        onPressed: (){},
        color: Color.fromRGBO(255, 178, 172, 0.75),
        highlightColor: Colors.transparent,
        splashColor: Color.fromRGBO(255, 178, 172, 0.9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }
}

class CenterNotchedBottomBar extends StatelessWidget {
  final int clickedIndex;
  final List<IconData> icons;
  final void Function(int) onPressed;
  const CenterNotchedBottomBar({
    this.icons, 
    this.clickedIndex,
    this.onPressed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BottomAppBar(
      notchMargin: 14,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: icons.map<Widget>((icon) {
          return IconButton(
            onPressed: () => onPressed(icons.indexOf(icon)),
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 15, bottom: 15),
            iconSize: 32,
            highlightColor: Colors.transparent,
            splashColor: Color.fromRGBO(255, 178, 172, 0.2),
            icon: Icon(
              icon,
              color: icons.indexOf(icon) == clickedIndex 
                ? Color.fromRGBO(255, 178, 172, 1)
                : Colors.grey
            ),
          );
        }).toList()..insert(2, SizedBox(width: 75)),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final IconData icon;
  final String name;
  final Color color;
  const CategoryButton({this.icon, this.name, this.color, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36, color: color), 
          Text(name, style: TextStyle(height: 1.3)),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.7),
        boxShadow: [
          BoxShadow(offset: Offset(0, 4), color: color.withOpacity(0.05), blurRadius: 8),
        ],
      ),
    );
  }
}

class TabTile extends StatelessWidget {
  final bool clicked;
  final String name;
  final Function onPressed;
  const TabTile({this.clicked, this.name, this.onPressed, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
      child: FlatButton(
        onPressed: onPressed,
        child: Text(name, style: TextStyle(color: clicked ? Colors.white: Colors.grey, fontSize: 16)),
        color: clicked ? Color.fromRGBO(255, 178, 172, 1): Colors.white54,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        highlightColor: Colors.transparent,
        splashColor: Colors.white12,
      ),
    );
  }
}

class WelcomeStatement extends StatelessWidget {
  const WelcomeStatement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "\t\tHi, ",
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(text: "Kavienan", style: TextStyle(color: Color.fromRGBO(255, 178, 172, 1))),
          TextSpan(
            text: "\n\tAll favourite products here.",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              height: 1.7,
            ),
          ),
          TextSpan(
            text: "\n\tLet's grab!",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
    );
  }
}