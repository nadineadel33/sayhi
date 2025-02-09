import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class EclipseContainer extends StatefulWidget {
  const EclipseContainer({super.key});

  @override
  _EclipseContainerState createState() => _EclipseContainerState();
}

class _EclipseContainerState extends State<EclipseContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    // ✅ Corrected Glow Animation
    _glowAnimation = Tween<double>(begin: 200.0, end: 300.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = ResponsiveValue<double>(
      context,
      defaultValue: 220.0,
      conditionalValues: [
        const Condition.smallerThan(name: TABLET, value: 350.0),
        const Condition.largerThan(name: TABLET, value: 300.0),
      ],
    ).value!;

    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xff00a8ff).withOpacity(0.7), // Bright Cyan Glow
                blurRadius: _glowAnimation.value,
                spreadRadius: _glowAnimation.value / 2.5,
              ),
            ],
          ),
        );
      },
    );
  }
}
