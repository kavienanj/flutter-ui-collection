import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_challege/week_1/widgets.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));
    return MaterialApp(
      title: "Week 1",
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

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _textStyleAnim;
  Animation _slideAnim;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this, 
      duration: new Duration(milliseconds: 500),
    );
    _textStyleAnim = TextStyleTween(
      begin: TextStyle(color: Colors.deepOrange, fontSize: 0.0),
      end: TextStyle(color: Colors.white, fontSize: 54.0)
    ).animate(new CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ))..addListener(() => setState(() {}));
    _slideAnim = new Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero
    ).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      )
    );
    Future.delayed(const Duration(seconds: 1), () {
      _controller.forward();
    });
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _deviceDimensions = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: _deviceDimensions.height * 0.15,
              left: 40,
            ),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                colors: [
                  Colors.deepOrange,
                  Colors.orangeAccent,
                ],
                begin: Alignment.topCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Login",
                  style: _textStyleAnim.value,
                ),
                SizedBox(height: 8),
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SlideTransition(
            position: _slideAnim,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(80)),
              child: Container(
                padding: EdgeInsets.only(left: 30, right: 30, top: 80),
                height: _deviceDimensions.height * 0.7,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LoginFields(),
                    FlatButton(
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      color: Colors.white,
                      highlightColor: Colors.orange.withOpacity(0.1),
                      splashColor: Colors.transparent,
                      onPressed: (){},
                    ),
                    FlatOvalButton(
                      color: Colors.orange.shade800,
                      splashColor: Colors.orange,
                      onPressed: () {},
                      text:  "Login",
                      yPadding: 20,
                      xPadding: 120,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Continue with social media",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatOvalButton(
                          color: Colors.blueAccent,
                          splashColor: Colors.white12,
                          onPressed: () {},
                          text: "Facebook",
                          yPadding: 15, 
                          xPadding: 45,
                        ),
                        FlatOvalButton(
                          color: Colors.black,
                          splashColor: Colors.white12,
                          onPressed: () {},
                          text: " Github ",
                          yPadding: 15, 
                          xPadding: 45,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
