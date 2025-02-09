import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;
  final bool isTitle;
  final int? maxLines;

  const TextWidget({
    Key? key,
    required this.text,
    required this.color,
    this.textSize = 16,
    this.maxLines,
    this.isTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: textSize,
        color: color,
        fontWeight: isTitle ? FontWeight.w600 : FontWeight.w400,
      ),
    );
  }
}
