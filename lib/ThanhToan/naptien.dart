import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maimeow/login/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 300, // Giới hạn chiều rộng
            padding: EdgeInsets.all(30.0), // Thêm khoảng cách bên trong
            child: Column(
              children: [
                Text(
                  'TechcomBank\n 482602092003\n Nguyen Van Huan',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                  textAlign: TextAlign.center, // Căn giữa văn bản
                ),
              // Image.asset("assets/mb.jpg", width: 200,),
               Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXZaajhbHTkaaLdEluWaUzcP1UsN4UXVcA-A&s'),
                Text(
                  'MB Bank\n 482602092003\n Nguyen Van Huan',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                  textAlign: TextAlign.center, // Căn giữa văn bản
                ),
                Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7XTylhjr8xFasIuZCM06gjRk74tlEMRUCMw&s"),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text('Quay lai'),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Xong'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}