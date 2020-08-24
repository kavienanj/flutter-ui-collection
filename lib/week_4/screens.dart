import 'package:flutter/material.dart';

class CheckoutSuccess extends StatefulWidget {
  const CheckoutSuccess({Key key}) : super(key: key);

  @override
  _CheckoutSuccessState createState() => _CheckoutSuccessState();
}

class _CheckoutSuccessState extends State<CheckoutSuccess> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _scaleAnimtion;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _scaleAnimtion = Tween<double>(begin: 0.0, end: 250.0).animate(
      CurvedAnimation(
        curve: Curves.elasticOut,
        parent: _controller,
      ),
    );
    _controller.addListener(() => setState((){}));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        Duration(seconds: 1),
        () => _controller.forward(),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.pinkAccent
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Container(
            width: _scaleAnimtion.value,
            height: _scaleAnimtion.value,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(_scaleAnimtion.value),
            ),
            child: Icon(
              Icons.check,
              size: 150*(_scaleAnimtion.value/250),
              color: Colors.white,
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 80,
        child: FlatButton(
          child: Text(
            "CHECKOUT AGAIN",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}