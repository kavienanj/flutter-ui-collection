import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ui_challege/week_5/widgets.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Week 5",
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      theme: ThemeData(accentColor: Colors.white, primaryColor: Colors.white),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final _bottomIcons = [Icons.home, Icons.compare_arrows, Icons.favorite_border, Icons.sort];
  final _tabs = ["For You", "Grocery", "Fruits & Vegetables", "Drinks", "New Today"];
  final _categories = [
    ["For You", Icons.person, Colors.red], 
    ["Offers", Icons.card_giftcard, Colors.pink], 
    ["Drinks", Icons.local_drink, Colors.purple], 
    ["Fast Food", Icons.fastfood, Colors.greenAccent],
  ];
  int _bottomClickedIndex = 0;
  int _selctedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: ListView(
          children: <Widget>[
            WelcomeStatement(),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 5,
                  child: SearchBar(),
                ),
                Flexible(
                  child: FilterButton(),
                ),
              ],
            ),
            SizedBox(height: 5),
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _tabs.map(
                  (_tabName) => TabTile(
                    name: _tabName, 
                    clicked: _tabs.indexOf(_tabName) == _selctedTab,
                    onPressed: () => setState(() => _selctedTab = _tabs.indexOf(_tabName)),
                  ),
                ).toList(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _categories.map(
                (icon) => CategoryButton(name: icon[0], icon: icon[1], color: icon[2])
              ).toList(),
            ),
            SizedBox(height: 35),
            Text(
              "\t\trecommended For you",
              style: TextStyle(
                color: Colors.black.withRed(2).withOpacity(0.65),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FruitCard(
                      name: "Strawberry",
                      mass: 1,
                      volume: 12.5,
                      color: Color(0xFFFFC8C4),
                      imageUrl: "http://www.pngall.com/wp-content/uploads/2016/05/Strawberry-Download-PNG.png",
                    ),
                    FruitCard(
                      name: "Avacado",
                      mass: 0.5,
                      volume: 10.5,
                      color: Color(0xFFADD9B4),
                      imageUrl: "http://pngimg.com/uploads/avocado/avocado_PNG15516.png",
                    ),
                    PromotionCard(),
                  ],
                ),
                Column(
                  children: <Widget>[
                    PromotionCard(),
                    FruitCard(
                      name: "Blueberry",
                      mass: 0.25,
                      volume: 12,
                      color: Color(0xFFA6AFDE),
                      imageUrl: "http://www.pngall.com/wp-content/uploads/2/Blueberry-PNG-HD-Image.png",
                    ),
                    FruitCard(
                      name: "Banana",
                      mass: 2,
                      volume: 11,
                      color: Color(0xFFFCF4A9),
                      imageUrl: "http://www.pngall.com/wp-content/uploads/2016/04/Banana-Free-PNG-Image.png",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: CenterNotchedBottomBar(
        icons: _bottomIcons, 
        clickedIndex: _bottomClickedIndex,
        onPressed: (_index) => setState(() => _bottomClickedIndex = _index),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "product",
        backgroundColor: Color.fromRGBO(255, 178, 172, 1),
        child: Icon(Icons.shopping_basket, color: Colors.white, size: 30),
        splashColor: Colors.transparent,
        highlightElevation: 1,
        elevation: 3,
        onPressed: () => print("pressed"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
