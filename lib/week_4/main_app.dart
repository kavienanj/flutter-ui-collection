import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_challege/week_4/screens.dart';
import 'package:ui_challege/week_4/widgets.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Week 4",
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

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  final _cardnumController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvcController = TextEditingController();
  final _nameController = TextEditingController();
  AnimationController _animationController;
  Animation<double> _rotationAnimation;
  var _cardNumber = "XXXX XXXX XXXX XXXX";
  var _cardCVC = "XXXX";
  var _cardExpiry = "YY/MM";
  var _cardHolder = "CARDHOLDER NAME";

  @override
  void initState() {
    super.initState();
    _cardnumController.addListener(_setCardNumber);
    _cvcController.addListener(_setCVC);
    _nameController.addListener(_setCardHolder);
    _animationController = AnimationController(
      vsync: this, duration: Duration(milliseconds: 1500),
    );
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        curve: Curves.easeOutBack,
        reverseCurve: Curves.easeInBack,
        parent: _animationController,
      ),
    );
    _animationController.addListener(() => setState((){}));
  }

  void _turnCardBack() {
    if (_animationController.value != 0.0) _animationController.reverse();
  }

  void _setExpiryDate() {
    _turnCardBack();
    showModalBottomSheet(
      context: context, 
      builder: (context) {
        return Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height/3,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Close", style: TextStyle(fontSize: 18, color: Colors.red)),
                    Text("Done", style: TextStyle(fontSize: 18, color: Colors.blueAccent)),
                  ].map((child) => FlatButton(
                      child: child,
                      onPressed: () => Navigator.of(context).pop(),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.grey[100],
                    ),
                  ).toList(),
                ),
              ),
              Flexible(
                flex: 5,
                child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  minimumYear: DateTime.now().year,
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() {
                     _expiryController.text = "${newDate.month}/${newDate.year.toString().substring(2)}";
                     _cardExpiry = _expiryController.text;
                    });
                  },
                  mode: CupertinoDatePickerMode.date,
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  void _setCardHolder() {
    _turnCardBack();
    setState(() {
      _cardHolder = _nameController.text.length == 0 ? "CARDHOLDER NAME": _nameController.text;
    });
  }

  void _setCVC() {
    if (_animationController.value == 0.0) {
      _animationController.forward();
    }
    setState(() {
      _cardCVC = _cvcController.text.padRight(4, "X").substring(0, 4);
    });
  }

  void _setCardNumber() {
    _turnCardBack();
    setState(() {
      final _text = _cardnumController.text.padRight(16, "X").substring(0, 16);
      _cardNumber = "${_text.substring(0, 4)} ${_text.substring(4, 8)} ${_text.substring(8, 12)} ${_text.substring(12, 16)}";
    });
  }

  @override
  void dispose() {
    _cardnumController.dispose();
    _expiryController.dispose();
    _cvcController.dispose();
    _nameController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          )
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height*0.27,
                child: CreditCard(
                  cardNumber: _cardNumber,
                  cardExpiry: _cardExpiry,
                  cardHolder: _cardHolder,
                  cardCVC: _cardCVC,
                  turnRatio: _rotationAnimation.value,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    CardNumberField(controller: _cardnumController, charLength: _cardnumController.text.length),
                    ExpiryField(controller: _expiryController, onTap: _setExpiryDate),
                    CVCField(controller: _cvcController, charLength: _cvcController.text.length),
                    NameField(controller: _nameController),
                    SizedBox(height: MediaQuery.of(context).size.height*0.1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 80,
        child: FlatButton(
          child: Text(
            "CHECKOUT",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          onPressed: () => Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => CheckoutSuccess(),
              transitionsBuilder: (_, animation, __, child) => ClipRRect(
                borderRadius: BorderRadius.circular((1-animation.value)*400),
                child: child,
              ),
            ),
          ),
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
