import 'package:flutter/material.dart';
import 'package:ui_challege/week_3/screens.dart';
import 'package:ui_challege/week_3/widgets.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Week 3",
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final chips = ["Vaccine", "Sanitizer", "Mask", "Gloves", "Soap", "Germicides"];
  final bigItems = [
    {
      "image": "assets/week_3/pro-vac.png",
      "name": "Pro-Vac Venco",
      "by": "by baximco",
      "price": "\$34.50",
    },
    {
      "image": "assets/week_3/live-b1.png",
      "name": "Disease Vaccine",
      "by": "by B1 Strain",
      "price": "\$21.44",
    },
  ];
  final navItems = [Icons.home, Icons.favorite_border, Icons.search, Icons.shopping_basket];
  var _selectedChip = "Vaccine";
  var _bottomNavIndex = 0;
  var _extended = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF222222),
        elevation: 0,
        leading: MenuIcon(),
        title: Text(
          "Home", 
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        centerTitle: false,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            width: 35,
            child: Icon(
              Icons.person,
              color: Colors.black,
              size: 26,
            ),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF222222), Colors.black.withOpacity(0.94)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
            child: ListView(
              children: [
                Container(
                  height: 60,
                  margin: const EdgeInsets.only(left: 4, top: 10),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: chips.map((name) {
                      return TopChip(
                        clicked: name == _selectedChip, 
                        text: name,
                        onClick: () => setState(() {
                          _selectedChip = name;
                        }),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  height: 380,
                  margin: const EdgeInsets.only(left: 4, top: 10),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: bigItems.map((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ProductPage(product: item),
                          )),
                          child: BigItemCard(
                            name: item['name'],
                            imageUrl: item['image'],
                            byUser: item['by'],
                            price: item['price'],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 30, 16, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sanitization",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _extended = !_extended),
                        child: Text(
                        !_extended ? "All": "Less",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(4,4,4, _extended ? 4: 50),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SmallItemCard(
                        name: "Mask",
                        imageUrl: "assets/week_3/kn95-mask.png",
                      ),
                      SmallItemCard(
                        name: "Gloves",
                        imageUrl: "assets/week_3/gloves.png",
                      ),
                    ],
                  ),
                ),
                if (_extended) Padding(
                  padding: const EdgeInsets.fromLTRB(4,0,4,50),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SmallItemCard(
                        name: "Vaccines",
                        imageUrl: "assets/week_3/live-b1.png",
                      ),
                      SmallItemCard(
                        name: "Syrubs",
                        imageUrl: "assets/week_3/pro-vac.png",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            minimum: EdgeInsets.only(bottom: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FloatingBottomNavBar(
                icons: navItems,
                clicked: _bottomNavIndex,
                onPressed: (i) => setState(() => _bottomNavIndex = i),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
