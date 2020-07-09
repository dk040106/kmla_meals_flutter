import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  Map meal;

  @override
  Widget build(BuildContext context) {
    meal = ModalRoute.of(context).settings.arguments;

    final controller = PageController(
      initialPage: 0,
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: PageView(
            controller: controller,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "아침",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    meal['breakfast'] ?? "No data",
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 2.0,
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "점심",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    meal['lunch'] ?? "No data",
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 2.0,
                      // fontFamily:
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "저녁",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    meal['dinner'] ?? "No data",
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 2.0,
                      // fontFamily:
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

