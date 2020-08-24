import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  final String cardNumber;
  final String cardExpiry;
  final String cardHolder;
  final String cardCVC;
  final double turnRatio;
  const CreditCard({
    this.cardNumber,
    this.cardExpiry,
    this.cardHolder,
    this.cardCVC,
    this.turnRatio,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const pi = 3.14;
    return IndexedStack(
      index: turnRatio >= 0.5 ? 0: 1,
      sizing: StackFit.expand,
      children: <Widget>[
        Transform(
          transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(pi*(1-turnRatio)),
          alignment: FractionalOffset.center,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFDEDEDE),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(15),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: double.infinity,
                    height: 35,
                    color: Color(0xFF323232),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: double.infinity,
                    height: 45,
                    color: Colors.white,
                  ),
                ),
                Align(
                  child: Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(top: 20, right: 20),
                    width: double.infinity,
                    child: Text("$cardCVC", style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, right: 100),
                    width: double.infinity,
                    height: 60,
                    color: Colors.grey,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Transform.rotate(
                    angle: 3.14/2,
                    child: Container(
                      height: 38,
                      width: 33,
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Icon(
                        Icons.sim_card,
                        color: Colors.yellow,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(-pi*turnRatio),
          alignment: FractionalOffset.center,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFDEDEDE),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("INFINITESHOP", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 15, bottom: 8),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(cardNumber, style: TextStyle(fontSize: 20)),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(text: "valid until\t\t\t\t", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      TextSpan(text: cardExpiry, style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(cardHolder, style: TextStyle(fontSize: 20)),
                    Transform.rotate(
                      angle: 3.14/2,
                      child: Container(
                        height: 38,
                        width: 33,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Icon(
                          Icons.sim_card,
                          color: Colors.yellow,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String counterText;
  final TextEditingController textController;
  final void Function() onTap;
  const CustomTextField({
    this.hintText,
    this.labelText,
    this.counterText,
    this.textController,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextField(
        readOnly: onTap != null,
        onTap: onTap,
        controller: textController,
        decoration: InputDecoration(
          counterText: counterText,
          counterStyle: TextStyle(color: Colors.white, fontSize: 14),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white, fontSize: 22),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
            borderSide: const BorderSide(color: Colors.white, width: 2),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white54),
          contentPadding: EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
            borderSide: const BorderSide(color: Colors.white, width: 2),
          ),
        ),
        cursorColor: Colors.white,
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}

class CardNumberField extends CustomTextField {
  const CardNumberField({TextEditingController controller, int charLength, Key key}): super(
    labelText: "Card Number",
    hintText: "XXXX XXXX XXXX XXXX",
    counterText: "$charLength/16",
    textController: controller,
    key: key,
  );
}

class ExpiryField extends CustomTextField {
  const ExpiryField({TextEditingController controller, void Function() onTap, Key key}): super(
    labelText: "Expiry Date",
    hintText: "MM/DD",
    textController: controller,
    onTap: onTap,
    key: key,
  );
}

class CVCField extends CustomTextField {
  const CVCField({TextEditingController controller, int charLength, Key key}): super(
    labelText: "CVC", 
    hintText: "XXXX",
    counterText: "$charLength/4",
    textController: controller,
    key: key,
  );
}

class NameField extends CustomTextField {
  const NameField({TextEditingController controller, Key key}): super(
    labelText: "Cardholder Name", 
    hintText: "Name", 
    textController: controller,
    key: key,
  );
}
