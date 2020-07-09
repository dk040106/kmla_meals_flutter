import 'package:flutter/material.dart';
import 'package:kmlameals/services/meal.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' as SpinKit;

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpMeal() async {
    Meal instance = Meal();
    await instance.getMeal();
    Navigator.pushReplacementNamed(context, '/meal', arguments: instance.meal);
  }

  @override
  void initState() {
    super.initState();
    setUpMeal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SpinKit.SpinKitFadingCube(
            color: Colors.blue,
            size: 75.0,
          ),
        )
    );
  }
}
