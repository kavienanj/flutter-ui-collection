import 'package:flutter/material.dart';
import 'package:ui_challege/week_2/widgets.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Week 1",
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = <Color>[
      Colors.white,
      Colors.pink.shade50,
      Colors.pink.shade100,
      Colors.pink.shade200,
    ];
    final widgets = <Widget>[
      TripleIconWidget(),
      StatusWidget(),
      OptionWidget(),
      QuoteWidget(),
    ];
    return Scaffold(
      backgroundColor: Colors.pink.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.pink),
          onPressed: () {},
        ),
        title: Text("Meetup", style: TextStyle(color: Colors.pink)),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.pink),
            onPressed: () {},
          ),
        ],
        centerTitle: false,
      ),
      body: ListView(
        children: List.generate(4, (int i) {
          return Container(
            color: colors[i+1 < 4 ? i+1 : i],
            child: Container(
              decoration: BoxDecoration(
                color: colors[i],
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 60.0),
                child: widgets[i],
              ),
            ),
          );
        }),
      ),
    );
  }
}
