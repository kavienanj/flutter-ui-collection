import 'package:flutter/material.dart';

class FlatOvalButton extends StatelessWidget {
  final Color color;
  final Color splashColor;
  final String text;
  final double yPadding;
  final double xPadding;
  final Function onPressed;
  const FlatOvalButton({
    Key key,
    this.color,
    this.splashColor,
    this.text,
    this.onPressed,
    this.xPadding,
    this.yPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: color,
      splashColor: Colors.transparent,
      highlightColor: splashColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      padding: EdgeInsets.symmetric(vertical: yPadding, horizontal: xPadding),
    );
  }
}

class UserIdTextField extends StatelessWidget {
  const UserIdTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      cursorColor: Colors.deepOrange.shade300,
      decoration: InputDecoration(
        fillColor: Colors.white,
        labelStyle: TextStyle(color: Colors.deepOrange.shade200),
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        labelText: "Email or Phone Number",
        border: InputBorder.none,
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      cursorColor: Colors.deepOrange,
      obscureText: true,
      decoration: InputDecoration(
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        labelStyle: TextStyle(color: Colors.deepOrange.shade200),
        labelText: "Password",
        border: InputBorder.none,
      ),
    );
  }
}

class LoginFields extends StatelessWidget {
  const LoginFields({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.deepOrange.shade100,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          UserIdTextField(),
          Divider(color: Colors.deepOrange.shade100),
          PasswordTextField(),
        ],
      ),
    );
  }
}
