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
  late Animation<Color?> _color1;
  late Animation<Color?> _color2;
  late Animation<Color?> _color3;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    // Define individual color animations
    _color1 = ColorTween(
      begin: Colors.white,
      end: const Color(0xff0266C2),
    ).animate(_controller);

    _color2 = ColorTween(
      begin: const Color(0xff0266C2),
      end: Colors.white,
    ).animate(_controller);

    _color3 = ColorTween(
      begin: const Color(0xff0266C2),
      end: const Color(0xff0266C2), // Keeps constant if needed
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
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
          colors: [_color1.value ?? Colors.white, _color2.value ?? Colors.blue, _color3.value ?? Colors.blue],
          gradientType: GradientType.linear,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          tileMode: TileMode.mirror,
        );
      },
    );
  }
}
