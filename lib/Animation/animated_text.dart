import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({Key? key}) : super(key: key);

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> with SingleTickerProviderStateMixin {
  late AnimationController _textAnimationController;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();

    // Khởi tạo AnimationController với thời gian ngắn hơn
    _textAnimationController = AnimationController(
      duration: const Duration(seconds: 1), // Thay đổi thời gian thành 1 giây
      vsync: this,
    );

    // Tạo tween cho hiệu ứng di chuyển lên xuống, tăng giá trị end
    _textAnimation = Tween<double>(begin: 0, end: 30).animate(CurvedAnimation(
      parent: _textAnimationController,
      curve: Curves.easeInOut,
    ));

    // Lặp lại animation
    _textAnimationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _textAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _textAnimationController,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _textAnimation.value),
            child: Text(
              "Mai Meow",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 43,
              ),
            ),
          );
        },
      ),
    );
  }
}