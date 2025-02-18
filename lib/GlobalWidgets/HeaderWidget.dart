import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    double width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Image.asset('Assets/images/AppLogo.png', height: isDesktop ? width * 0.05 : width * 0.08),
        const Spacer(
          flex: 4,
        ),
        const Row(
          spacing: 40,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Start using",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            Text("About Us",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(
              width: 40,
            )
          ],
        ),
      ],
    );
  }
}
