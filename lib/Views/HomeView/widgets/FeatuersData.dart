import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FeaturesData extends StatefulWidget {
  const FeaturesData({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String image;

  @override
  _FeaturesDataState createState() => _FeaturesDataState();
}

class _FeaturesDataState extends State<FeaturesData> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // **Responsive Width**
    double width = ResponsiveValue<double>(
      context,
      defaultValue: 820.0,
      conditionalValues: [
        const Condition.smallerThan(name: TABLET, value: 500.0),
        const Condition.largerThan(name: TABLET, value: 1100.0),
      ],
    ).value!;

    // **Responsive Font Sizes**
    double fontSize = ResponsiveValue<double>(
      context,
      defaultValue: 24.0,
      conditionalValues: [
        Condition.smallerThan(name: TABLET, value: width * 0.03),
        Condition.equals(name: TABLET, value: width * 0.025),
        Condition.largerThan(name: TABLET, value: width * 0.027),
      ],
    ).value!;

    double subTitleFontSize = fontSize * 0.6;

    // **Responsive Padding & Image Size**
    double paddingSize = ResponsiveValue<double>(
      context,
      defaultValue: 8.0,
      conditionalValues: [
        const Condition.smallerThan(name: TABLET, value: 6.0),
        const Condition.largerThan(name: TABLET, value: 12.0),
      ],
    ).value!;

    double imageSize = ResponsiveValue<double>(
      context,
      defaultValue: 40.0,
      conditionalValues: [
        const Condition.smallerThan(name: TABLET, value: 30.0),
        const Condition.largerThan(name: TABLET, value: 80.0),
      ],
    ).value!;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 300),
        tween: Tween<double>(begin: 1.0, end: _isHovered ? 1.05 : 1.0),
        builder: (context, double scale, child) {
          return Transform.scale(
            scale: scale,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: width * 0.5,
              padding: EdgeInsets.all(paddingSize),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(_isHovered ? 0.2 : 0.1),
                borderRadius: BorderRadius.circular(12),
                boxShadow: _isHovered
                    ? [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ]
                    : [],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(paddingSize),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: _isHovered ? 1.0 : 0.9,
                      child: Transform.scale(
                        scale: _isHovered ? 1.1 : 1.0,
                        child: Image.asset(
                          widget.image,
                          width: imageSize,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(paddingSize),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            widget.subTitle,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: subTitleFontSize,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
