import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Animation/animated_text.dart';
import '../InterfaceMain/screenmain.dart';
import '../SignUp/forgetpass.dart';
import '../SignUp/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _HitClubState();
}

class _HitClubState extends State<Login> with SingleTickerProviderStateMixin {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';
  bool _isPasswordVisible = false;
  bool _rememberMe = false; // Thêm biến ghi nhớ tài khoản

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
    // Tải thông tin đã lưu khi khởi động

  }
  void _loadSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');
    String? savePass = prefs.getString('password');
    if (savedUsername != null && savePass != null) {
      _usernameController.text = savedUsername;
      _passwordController.text = savePass;
      _rememberMe = true; // Đánh dấu là đã ghi nhớ
    }
  }

  Future<void> _login() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    if (username == 'meohun' && password == '12345') {
      setState(() {
        _errorMessage = '';
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (_rememberMe) {
        prefs.setString('username', username);
        prefs.setString('password', password);
      } else {
        prefs.remove('username');
        prefs.remove('password');
        // Xóa nếu không ghi nhớ
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TaiXiuScreen()),
      );
    } else {
      setState(() {
        _errorMessage = 'Tài khoản hoặc mật khẩu không chính xác!';
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
          child: Column(children: <Widget>[
            Expanded(
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
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(
                      child: Image.network(
                        'https://hitclub.com/wp-content/uploads/2024/05/hit-club.webp',
                        width: 115,
                        height: 102, // Adjust height as needed
                        fit: BoxFit.cover, // Adjust the fit as needed
                      ),
                    ),
                  ),

                        AnimatedText(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                      child: TextField(
                        controller: _usernameController,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Tài khoản",
                          labelStyle: TextStyle(color: Color(0xff888888), fontSize: 15),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: <Widget>[
                          TextField(
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            obscureText: !_isPasswordVisible, // Toggle visibility
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: "Mật khẩu",
                              labelStyle: TextStyle(color: Color(0xff888888), fontSize: 15),
                              border: InputBorder.none, // Remove default border
                              contentPadding: EdgeInsets.all(15), // Padding inside TextField
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible; // Toggle visibility
                                });
                              },
                              child: Text(
                                _isPasswordVisible ? "Ẩn" : "Hiện", // Change text based on visibility
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  if (_errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        _errorMessage,
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                      ),
                      Text("Nhớ tài khoản"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _login();
                        },
                        child: Text(
                          "Đăng nhập",
                          style: TextStyle(fontSize: 17, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  // Container
                  SizedBox(
                    height: 130,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=>ForgotPassword()),
                            );
                          }, // Thêm logic cho "Forget Password" nếu cần
                          child: Text('Quên mật khẩu',style: TextStyle(color: Colors.blue),),
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Bạn chưa có tài khoản? ,',
                                style: TextStyle(fontSize: 15, color: Colors.black),
                              ),
                              TextSpan(
                                text: 'Đăng kí?',
                                style: TextStyle(fontSize: 15, color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => SignUp()),
                                    ); //
                                  },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
          ),
        ));
  }
}