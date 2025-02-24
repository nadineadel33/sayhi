import 'package:flutter/material.dart';

class EditButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final Color color;
  final String text;

  const EditButton({
    Key? key,
    this.onPressed,
    this.width = 100,
    this.height = 40,
    this.color = Colors.blueAccent,
    required this.text,
  }) : super(key: key);

  @override
  State<EditButton> createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: _isHovered ? Colors.blue : widget.color,
          borderRadius: BorderRadius.circular(8),
          boxShadow: _isHovered
              ? [
            BoxShadow(
              color: Colors.blue.withOpacity(0.4),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            )
          ]
              : [],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: widget.onPressed ?? () {},
          child: Text(
            widget.text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}