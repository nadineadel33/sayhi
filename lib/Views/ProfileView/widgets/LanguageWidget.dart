import 'package:flutter/material.dart';

class LanguageWidget extends StatefulWidget {
  final Function(String?)? onChanged;
  final String? initialValue;
  final List<String> languageOptions;

  const LanguageWidget({
    super.key,
    this.onChanged,
    this.initialValue,
    this.languageOptions = const ['English', 'Arabic', 'French', 'Spanish'],
  });

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  String? _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonFormField<String>(
        value: _selectedLanguage,
        decoration: InputDecoration(
          suffixIcon: _selectedLanguage != null
              ? IconButton(
            icon: const Icon(Icons.clear, color: Colors.grey),
            onPressed: () {
              setState(() => _selectedLanguage = null);
              if (widget.onChanged != null) {
                widget.onChanged!(null);
              }
            },
          )
              : null,
          labelText: 'Language',
          labelStyle: const TextStyle(color: Colors.black),
          hintText: 'Select Language',
          hintStyle: const TextStyle(fontSize: 12, color: Color(0xff115bbf)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Color(0xff115bbf)),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        items: widget.languageOptions.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() => _selectedLanguage = value);
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
      ),
    );
  }
}
