import 'package:flutter/material.dart';
import 'Method/getmethod.dart';
import 'Method/postmethod.dart';
import 'Method/putmethod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home:PostMethod(),
    );
  }
}


