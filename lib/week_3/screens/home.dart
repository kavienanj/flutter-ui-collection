import 'package:flutter/material.dart';
import '../screens.dart';
import '../widgets.dart';
import '../models/medicine.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final chips = ["All", "Vaccine", "Sanitizer", "Mask", "Gloves", "Soap", "Germicides"];
  var _selectedChip = "All";
  var _extended = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
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
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Best Deals",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text(
                "View All",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 380,
          margin: const EdgeInsets.only(left: 4, top: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: itemList.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ProductPage(product: item),
                  )),
                  child: BigItemCard(
                    product: item,
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
                !_extended ? "View All": "View Less",
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
    );
  }
}
