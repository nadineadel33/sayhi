import 'package:flutter/material.dart';
import 'CustomButton.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Image.asset('Assets/images/AppLogo.png', height: isDesktop ? width * 0.05 : width * 0.08),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text(
                "Home",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
              child: const Text(
                "About Us",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            if (isDesktop) ...[
              const SizedBox(width: 20), // Spacing for desktop button
              CustomButton(
                width: 100,
                height: 40,
                title: "Sign Up",
                fontSize: 14,
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
                },
              ),
            ],
          ],
        ),
      ],
    );
  }
}