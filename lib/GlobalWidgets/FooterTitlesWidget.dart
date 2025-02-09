import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FooterTitles extends StatelessWidget {
  final VoidCallback? onAboutTap;
  final VoidCallback? onContactTap; // ✅ Add this line

  const FooterTitles({super.key, this.onAboutTap, this.onContactTap}); // ✅ Update constructor

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    double fontSize = isDesktop ? 14 : 12;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('© sayHI TEAM', style: TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: fontSize)),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: onAboutTap,
            child: Text('Terms of Service', style: TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: fontSize)),
          ),
          const SizedBox(width: 20),
          GestureDetector( // ✅ Add GestureDetector for onContactTap
            onTap: onContactTap,
            child: Text('Privacy Policy', style: TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: fontSize)),
          ),
          const SizedBox(width: 20),
          Text('Cookies', style: TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: fontSize)),
        ],
      ),
    );
  }
}
