import 'package:flutter/material.dart';
import 'package:text_gradiate/text_gradiate.dart';

class GradientText extends StatefulWidget {
  const GradientText({
    super.key,
    required this.text,
    required this.fontSize,
  });

  final String text;
  final double fontSize;

  @override
  _GradientTextState createState() => _GradientTextState();
}

class _GradientTextState extends State<GradientText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<List<Color>> _gradientAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _gradientAnimation = _controller.drive(
      TweenSequence<List<Color>>([
        TweenSequenceItem(
          weight: 1.0,
          tween: Tween(
            begin: [Colors.white, Color(0xff0266C2), Color(0xff0266C2)],
            end: [Color(0xff0266C2), Colors.white, Color(0xff0266C2)],
          ),
        ),
        TweenSequenceItem(
          weight: 1.0,
          tween: Tween(
            begin: [Color(0xff0266C2), Colors.white, Color(0xff0266C2)],
            end: [Colors.white, Color(0xff0266C2), Colors.white],
          ),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _gradientAnimation,
      builder: (context, child) {
        return TextGradiate(
          text: Text(
            widget.text,
            style: TextStyle(
              fontSize: widget.fontSize,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
            maxLines: 5,
            textAlign: TextAlign.center,
          ),
          colors: _gradientAnimation.value,
          gradientType: GradientType.linear,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          tileMode: TileMode.mirror,
        );
      },
    );
  }
}
