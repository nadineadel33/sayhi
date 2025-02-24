import 'package:flutter/material.dart';
import 'package:sayHI/GlobalWidgets/HeaderWidget.dart';
import 'package:sayHI/Views/AuthView/LoginWidget.dart';
import 'package:sayHI/Views/AuthView/widgets/AuthGlassWidget.dart';
import 'package:sayHI/Views/HomeView/widgets/EclipseContainer.dart';

import '../../GlobalWidgets/FooterTitlesWidget.dart';
import 'Register.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double width = size.width;
    double height = size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'Assets/images/Background09.jpg',
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          ),

          // Dark Overlay for Contrast
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),

          // Decorative Eclipse Containers
          const Positioned(bottom: 0, left: 0, child: EclipseContainer()),
          const Positioned(top: 0, right: 0, child: EclipseContainer()),

          // Main Column Layout
          Column(
            children: [
              // Header Section
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 70),
                child: HeaderWidget(),
              ),

              const SizedBox(height: 50),

              // Auth Card with Glass Effect
              AuthGlassWidget(
                child: isLogin
                    ? LoginWidget(
                        onTap: () {
                          setState(() {
                            isLogin = false;
                          });
                        },
                      )
                    : RegisterView(
                        onTap: () {
                          setState(() {
                            isLogin = true;
                          });
                        },
                      ),
              ),

              const Spacer(),

              // Footer Section
              const FooterTitles(),
            ],
          ),
        ],
      ),
    );
  }
}
