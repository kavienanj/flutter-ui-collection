import 'package:flutter/material.dart';

class TripleIconWidget extends StatelessWidget {
  const TripleIconWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Icons.music_note, Icons.trending_up, Icons.favorite_border].map((icon) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              icon,
              color: Colors.pink,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.pink, width: 2),
          ),
        );
      }).toList(),
    );
  }
}

class StatusWidget extends StatelessWidget {
  const StatusWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Today 6:00 PM",
          style: TextStyle(
            color: Colors.pink,
            fontSize: 17,
          ),
        ),
        SizedBox(height: 6),
        Text(
          "Yoga and Meditation for Beginners",
          style: TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [30.0, 50.0, 70.0, 90.0].map((padd) {
                return Row(
                  children: [
                    SizedBox(
                      width: padd,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.indigo.withRed(padd.round()*2),
                      child: Icon(
                        Icons.person
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Marie and 4 others",
              style: TextStyle(
                color: Colors.pink,
                fontSize: 16,
              ),
            )
          ],
        )
      ],
    );
  }
}

class OptionWidget extends StatelessWidget {
  const OptionWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(height: 6),
        Text(
          "Friday 8:00 PM",
          style: TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 6),
        Text(
          "Practise French, English and Chinese",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Icons.check, Icons.close].map((icon) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  icon,
                  size: 26,
                  color: Colors.pink,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.pink, width: 3),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(height: 6),
        Text(
          "Today 9:00 PM",
          style: TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 6),
        Text(
          "Easy and Gentle Yoga",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.all(10),
          child: ActionChip(
            label: Text(
              "You are going !",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            backgroundColor: Colors.pink.shade100,
            onPressed: (){},
            labelPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            elevation: 2,
            pressElevation: 3,
          ),
        ),
      ],
    );
  }
}
