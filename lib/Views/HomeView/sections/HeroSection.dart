import 'package:flutter/material.dart';
import 'package:sayHI/GlobalWidgets/CustomButton.dart';
import 'package:sayHI/GlobalWidgets/HeaderWidget.dart';
import 'package:sayHI/Views/AuthView/SignIn.dart';
import 'package:sayHI/Views/HomeView/widgets/GradientText.dart';
import 'package:sayHI/GlobalWidgets/GlassContainer.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

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
          // Background Image
          Center(
            child: Image.asset(
              'assets/images/background02.jpg', // Updated path
              width: width * 0.5,
            ),
          ),

          // Dark Overlay
          Container(
            width: width,
            height: height,
            color: Colors.black.withOpacity(0.8),
          ),

          // Content
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 70),
                child: HeaderWidget(),
              ),
              const SizedBox(height: 100),

              // Hero Text
              GradientText(
                text: 'Chat and Connect Instantly!',
                fontSize: width * 0.05,
              ),
              const Text(
                'with sayHI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                ),
              ),

              const Spacer(flex: 2),

              // START NOW Button (Navigates to Sign In Page)
              CustomButton(
                width: width * 0.1,
                height: height * 0.07,
                title: 'START NOW',
                fontSize: fontSize,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignIn()),
                  );
                },
              ),

              const Spacer(flex: 4),

              // Powered By AI Text
              GradientText(
                text: 'Powered By AI',
                fontSize: width * 0.019,
              ),
              Image.asset(
                'assets/images/ai_logo.png', // Updated AI logo
                height: height * 0.12,
              ),

              const Spacer(flex: 3),
            ],
          ),
        ],
      ),
    );
  }
}
