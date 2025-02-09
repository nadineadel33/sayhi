import 'package:flutter/material.dart';

class GenderWidget extends StatefulWidget {
  final Function(String?)? onChanged;
  final String? initialValue;
  final List<String> genderOptions;

  const GenderWidget({
    super.key,
    this.onChanged,
    this.initialValue,
    this.genderOptions = const ['Male', 'Female', 'Other'],
  });

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    _selectedGender = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonFormField<String>(
        value: _selectedGender,
        decoration: InputDecoration(
          suffixIcon: _selectedGender != null
              ? IconButton(
            icon: const Icon(Icons.clear, color: Colors.grey),
            onPressed: () {
              setState(() => _selectedGender = null);
              if (widget.onChanged != null) {
                widget.onChanged!(null);
              }
            },
          )
              : null,
          labelText: 'Gender',
          labelStyle: const TextStyle(color: Colors.black),
          hintText: 'Select Gender',
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
        items: widget.genderOptions.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() => _selectedGender = value);
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
      ),
    );
  }
}
