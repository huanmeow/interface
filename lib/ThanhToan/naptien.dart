import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maimeow/login/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Text('TechcomBank\n 482602092003\n Nguyen Van Huan', style: TextStyle(color: Colors.blue, fontSize: 30),),
                    Icon(Icons.ac_unit),
                  Text('MB Bank\n 482602092003\n Nguyen Van Huan', style: TextStyle(color: Colors.blue, fontSize: 30),),
                  Icon(Icons.accessibility_new),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          ElevatedButton(onPressed: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context)=> Login())
                            );

                          }, child: Text('Quay lai')),
                          SizedBox(width: 10,),

                          ElevatedButton(onPressed: (){

                          }, child: Text('Xong')),
                        ],
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}