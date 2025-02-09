import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sayHI/Views/HomeView/widgets/EclipseContainer.dart';
import 'package:sayHI/Views/HomeView/widgets/FeaturesData.dart';

class WhyUsSection extends StatelessWidget {
  const WhyUsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double fontSize = ResponsiveValue<double>(context,
        defaultValue: 28.0,
        conditionalValues: [
          Condition.smallerThan(name: TABLET, value: width * 0.026),
          Condition.equals(name: TABLET, value: width * 0.02),
          Condition.largerThan(name: TABLET, value: width * 0.04),
        ]).value!;

    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(color: Colors.black),
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                'assets/images/background09.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Dark Overlay
          Container(
            width: width,
            height: height,
            color: Colors.black.withOpacity(0.7),
          ),

          // Eclipse Effects
          Positioned(top: 0, right: 0, child: EclipseContainer()),
          Positioned(bottom: 0, left: 0, child: EclipseContainer()),

          // Features Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),

                  // Section Title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Why Choose Us?',
                        style: TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Key Features That Make SayHI Stand Out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSize,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.08),

                  // Features List
                  ResponsiveBreakpoints.of(context).isDesktop
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FeaturesDataFirstColumn(),
                      const SizedBox(width: 50),
                      const FeaturesDataSecondColumn(),
                    ],
                  )
                      : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      FeaturesDataFirstColumn(),
                      SizedBox(height: 30),
                      FeaturesDataSecondColumn(),
                    ],
                  ),

                  const Spacer(flex: 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
