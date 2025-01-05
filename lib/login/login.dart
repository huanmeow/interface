import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ThanhToan/naptien.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _HitClubState();
}

class _HitClubState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage ='';

  void _login(){
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    if (username == 'meohun' && password == '12345'){
      setState(() {
        _errorMessage='';
      });
    Navigator.push(
      context, MaterialPageRoute(builder: (context)=> MyApp()),
    );
    }
    else {
      setState(() {
        _errorMessage=' Account or Password not exactly !';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  // child: Icon(Icons.accessible_forward),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Center(
                  child: Text(
                    "LOGIN Mai Meow",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 45  ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  controller: _usernameController,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                      labelText: "Username",
                      labelStyle:
                      TextStyle(color: Color(0xff888888), fontSize: 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 15)),
                    ),
                    Text(
                      "Show",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Center(
                  child: ElevatedButton(

                      onPressed: () {  },
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context)=> MyApp())
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 17, color: Colors.blue),
                        ),
                      )),
                ),
              ),
           //container
              SizedBox(
                height: 130,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(onPressed: (){},
                        child: Text('Forget Password')),
                    RichText(text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'You have not an account,',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Sign up ?',
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          )
                        ]
                    )
                    )
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }}
