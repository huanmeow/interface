
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login/login.dart';

class MyApp1 extends StatefulWidget {
  const MyApp1({super.key});
  @override
  State<MyApp1> createState() => _MyApp1State();
}
class _MyApp1State extends State<MyApp1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false, // Remove the debug banner
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
