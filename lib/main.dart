import 'package:flutter/material.dart';

import 'login/login.dart';

void main(){
  runApp(const MyApp1());
  }

class MyApp1 extends StatefulWidget {
  const MyApp1({super.key});
  @override
  State<MyApp1> createState() => _MyApp1State();
}
class _MyApp1State extends State<MyApp1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: const Login(


            )
        )
    );
  }
}
