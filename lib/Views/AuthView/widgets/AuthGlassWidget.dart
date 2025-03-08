import 'package:sayHI/GlobalWidgets/GlassContainer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AuthGlassWidget extends StatelessWidget {
  const AuthGlassWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    Size size = MediaQuery.sizeOf(context);
    double width = size.width;
    double height = size.height;

    return Stack(
      alignment: Alignment.center,
      children: [
        // Glass Background for Desktop
        if (isDesktop)
          GlassContainer(
            width: width * 0.6,
            height: height * 0.7,
            blur: 15,
            // borderRadius: 20,
            // opacity: 0.2,
            child: const SizedBox(),
          ),

        SizedBox(
          width: isDesktop ? width * 0.7 : width * 0.85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isDesktop) const Spacer(),

              // App Logo (Visible only on Desktop)
              if (isDesktop)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'Assets/images/AppLargeLogo.png',
                      width: width * 0.1,
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'Assets/images/AppNameLogo.png',
                      width: width * 0.1,
                    ),
                  ],
                ),

              if (isDesktop) const Spacer(),

              // Auth Container
              Container(
                width: isDesktop ? width * 0.35 : width * 0.85,
                height: isDesktop ? height * 0.68 : height * 0.65,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: child,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
