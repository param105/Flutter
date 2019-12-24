import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textWidget = Text(
      generateRandomNumber(),
      textDirection: TextDirection.ltr,
      style: TextStyle(color: Colors.white, fontSize: 40.0),
    );

    return Center(child: BusinessCard());
  }

  ///generate Doc comments
  String generateRandomNumber() {
    var random = Random();
    return random.nextInt(10).toString();
  }
}

class BusinessCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.deepPurple,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.account_circle, size: 50),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Parmeshwar Chavan",
                    style: Theme.of(context).textTheme.headline,
                  ),
                  Text(
                    "Android Engineer",
                    style: Theme.of(context).textTheme.subhead,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Zeal College, Pune"),
              Text("411048"),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: <Widget>[],
          ),
        ],
      ),
    );
  }
}
