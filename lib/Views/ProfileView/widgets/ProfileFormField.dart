import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProfileFormField extends StatefulWidget {
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? hintText;
  final String label;
  final bool? isCenterHint;
  final Color? color;
  final bool? isEnabled;
  final bool numbersOnly;

  const ProfileFormField({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.hintText,
    this.validator,
    required this.obscureText,
    this.isCenterHint,
    required this.label,
    this.numbersOnly = false,
    this.color,
    this.isEnabled,
  }) : super(key: key);

  @override
  State<ProfileFormField> createState() => _ProfileFormFieldState();
}

class _ProfileFormFieldState extends State<ProfileFormField> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile Picture Section 📷
        Center(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                backgroundImage: _imageFile != null
                    ? FileImage(_imageFile!) as ImageProvider
                    : const AssetImage("Assets/images/default_profile.png"),
              ),
              // Edit Icon 📸
              Positioned(
                bottom: 5,
                right: 5,
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(5),
                    child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Text Form Field ✍️
        TextFormField(
          enabled: widget.isEnabled ?? true,
          validator: widget.validator,
          obscureText: widget.obscureText,
          keyboardType: widget.numbersOnly
              ? const TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
          inputFormatters: widget.numbersOnly
              ? [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}$'))]
              : null,
          cursorColor: Colors.grey,
          style: TextStyle(
            color: widget.color ?? Colors.black,
            fontWeight: FontWeight.bold,
          ),
          controller: widget.controller,
          onChanged: widget.onChanged,
          textAlign: widget.isCenterHint == null ? TextAlign.left : TextAlign.center,
          decoration: InputDecoration(
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: widget.color ?? const Color(0xff115bbf),
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelText: widget.label,
            labelStyle: TextStyle(color: widget.color ?? Colors.black),
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              fontSize: 12,
              color: Color(0xff115bbf),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: widget.color ?? Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xff115bbf),
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusColor: const Color(0xff115bbf),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ],
    );
  }
}
