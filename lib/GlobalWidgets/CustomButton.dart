import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final double fontSize;
  final VoidCallback? onTap;

  const CustomButton({
    Key? key,
    required this.width,
    required this.height,
    required this.title,
    required this.fontSize,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xff0266C2),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: const Offset(2, 3),
            )
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
