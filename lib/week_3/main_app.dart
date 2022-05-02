import 'package:flutter/material.dart';
import 'package:ui_challege/week_3/screens/cart.dart';
import 'package:ui_challege/week_3/widgets.dart';
import 'screens/home.dart';
import 'screens/liked.dart';

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

  final _navItems = [Icons.home, Icons.favorite_border, Icons.search, Icons.shopping_basket];
  final List<Widget> _views = [HomeView(), LikedView(), HomeView(), CartView()];
  var _bottomNavIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF222222),
        elevation: 0,
        leading: MenuIcon(),
        title: Text(
          "MEDotar", 
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
            child: _views[_bottomNavIndex],
          ),
          SafeArea(
            minimum: EdgeInsets.only(bottom: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FloatingBottomNavBar(
                icons: _navItems,
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
