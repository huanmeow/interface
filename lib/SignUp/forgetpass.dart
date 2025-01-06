import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  String _message = '';

  void _resetPassword() {
    final String email = _emailController.text;

    // Giả lập việc gửi email (thực tế bạn sẽ gọi API gửi email)
    if (email.isNotEmpty) {
      setState(() {
        _message = 'Tài khoản và mật khẩu mới đã được gửi về email';
      });
    } else {
      setState(() {
        _message = 'Vui lòng nhập địa chỉ email!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lấy Lại Mật Khẩu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Địa chỉ Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetPassword,
              child: Text('Lấy Lại Mật Khẩu'),
            ),
            SizedBox(height: 20),
            if (_message.isNotEmpty)
              Text(
                _message,
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}