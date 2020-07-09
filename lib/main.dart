import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kmlameals/view/home.dart';
import 'package:kmlameals/view/loading.dart';

void main() => runApp(
  MaterialApp(
    theme: new ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialRoute: "/",
    routes: {
      '/': (context) => Loading(),
      '/meal': (context) => Home(),
    }
  )
);