import 'package:flutter/material.dart';

import '../../../GlobalWidgets/CustomButton.dart';
import '../../../GlobalWidgets/HeaderWidget.dart';
import '../widgets/GradientText.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double width = size.width;
    double height = size.height;
    double fontSize = width < 1000 ? width * 0.012 : width * 0.01;
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(color: Colors.black),
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              'Assets/images/Background02.jpg',
              width: width * 0.5,
            ),
          ),
          Container(
            width: width,
            height: height,
            color: Colors.black.withOpacity(0.8),
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 70),
                child: HeaderWidget(),
              ),
              const SizedBox(
                height: 100,
              ),
              GradientText(
                text: 'Breaking Barriers with \nTechnology',
                fontSize: width * 0.05,
              ),
              const Text(
                'Sign Language Translation Made Simple',
                style: TextStyle(color: Colors.white, fontSize: 30),
                textAlign: TextAlign.center,
              ),
              const Spacer(
                flex: 2,
              ),
              CustomButton(
                width: width * 0.1,
                height: height * 0.07,
                title: 'TRY NOW',
                fontSize: fontSize,
              ),
              const Spacer(
                flex: 4,
              ),
              GradientText(
                text: 'Powered by AI & ML',
                fontSize: width * 0.019,
              ),
              const Spacer(flex: 3),
            ],
          ),
        ],
      ),
    );
  }
}
