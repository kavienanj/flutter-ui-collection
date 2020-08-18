import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15, right: 14),
          height: 3.5,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15, right: 4, top: 6),
          height: 3.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15, right: 24, top: 6),
          height: 3.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ],
    );
  }
}

class TileButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final bool clicked;
  final int popUpNum;
  const TileButton({this.clicked = false, this.icon, this.popUpNum, this.onPressed,  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: clicked ? Colors.yellow: Colors.white30,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: clicked ? Colors.black: Colors.white, size: 28),
          ),
          if (popUpNum != null) Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.yellowAccent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                "12",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FloatingBottomNavBar extends StatelessWidget {
  final List icons;
  final Function(int) onPressed;
  final int clicked;
  const FloatingBottomNavBar({
    this.icons,
    this.onPressed,
    this.clicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF373737).withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
      ),
      width: MediaQuery.of(context).size.width*0.8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: icons.map((icon) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            child: TileButton(
              onPressed: () => onPressed(icons.indexOf(icon)),
              icon: icon,
              popUpNum: icons.indexOf(icon) == icons.length-1 ? 12: null,
              clicked: icons.indexOf(icon) == clicked ? true: false,
            ),
          );
        }).toList(),
      ),
    );
  }
}


class TopChip extends StatelessWidget {
  final bool clicked;
  final Function onClick;
  final String text;
  final double paddingX;
  const TopChip({this.clicked, this.onClick, this.text, this.paddingX, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: paddingX ?? 10.0, vertical: 10.0),
        height: 60,
        decoration: BoxDecoration(
          color: clicked ? Colors.white: Colors.white24,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: clicked ? Colors.black: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class BigItemCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String byUser;
  final String price;
  const BigItemCard({
    this.imageUrl,
    this.name,
    this.byUser,
    this.price,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: MediaQuery.of(context).size.width*0.9,
      width: MediaQuery.of(context).size.width*0.6,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: imageUrl,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.fitHeight,
                height: MediaQuery.of(context).size.width*0.7,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(18),
            height: MediaQuery.of(context).size.width*0.75,
            width: MediaQuery.of(context).size.width*0.6,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  byUser,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 15,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 26,
                      ),
                    ),
                    TileButton(
                      clicked: true,
                      icon: Icons.add_shopping_cart,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SmallItemCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  const SmallItemCard({
    this.name,
    this.imageUrl,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: MediaQuery.of(context).size.width*0.508,
      width: MediaQuery.of(context).size.width*0.44,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fitHeight,
              height: MediaQuery.of(context).size.width*0.43,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            height: MediaQuery.of(context).size.width*0.42,
            width: MediaQuery.of(context).size.width*0.44,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
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

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                "--",
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: -10,
                  fontSize: 36,
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 50,
            child: Center(
              child: Text(
                "1",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                "+",
                style: TextStyle(
                  fontSize: 36,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}