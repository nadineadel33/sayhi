import 'package:sayHI/GlobalWidgets/GlassContainer.dart';
import 'package:flutter/material.dart';

class SliderGlassWidget extends StatefulWidget {
  const SliderGlassWidget({
    super.key,
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  @override
  _SliderGlassWidgetState createState() => _SliderGlassWidgetState();
}

class _SliderGlassWidgetState extends State<SliderGlassWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 300),
          tween: Tween<double>(begin: 1.0, end: _isHovered ? 1.05 : 1.0),
          builder: (context, double scale, child) {
            return Transform.scale(
              scale: scale,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                transform: Matrix4.translationValues(0, _isHovered ? -5 : 0, 0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(_isHovered ? 0.5 : 0.2),
                      blurRadius: _isHovered ? 15 : 10,
                      spreadRadius: _isHovered ? 3 : 1,
                    ),
                  ],
                ),
                child: GlassContainer(
                  width: 400,
                  height: 500,
                  blur: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // **Title**
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // **Image**
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Image.asset(widget.image, height: 200),
                      ),

                      const SizedBox(height: 40),

                      // **Glass Button**
                      GestureDetector(
                        onTap: () {
                          // Add functionality here (e.g., navigate, show modal, etc.)
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: TweenAnimationBuilder(
                            duration: const Duration(milliseconds: 200),
                            tween: Tween<double>(begin: 1.0, end: _isHovered ? 0.8 : 1.0),
                            builder: (context, double opacity, child) {
                              return GlassContainer(
                                width: 200,
                                height: 70,
                                blur: 10,
                                child: Center(
                                  child: Opacity(
                                    opacity: opacity,
                                    child: const Text(
                                      'View Code',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
