import 'package:final_620710726/view/game.dart';
import 'package:flutter/material.dart';

import 'package:final_620710726/services/api.dart';


void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Food',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: animals(),
    );
  }
}