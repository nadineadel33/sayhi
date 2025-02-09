import 'package:flutter/material.dart';

class PlanTypeWidget extends StatefulWidget {
  final Function(String?)? onChanged;
  final String? initialValue;
  final List<String> planOptions;

  const PlanTypeWidget({
    super.key,
    this.onChanged,
    this.initialValue,
    this.planOptions = const ['Free', 'Basic', 'Premium', 'Enterprise'],
  });

  @override
  State<PlanTypeWidget> createState() => _PlanTypeWidgetState();
}

class _PlanTypeWidgetState extends State<PlanTypeWidget> {
  String? _selectedPlan;

  @override
  void initState() {
    super.initState();
    _selectedPlan = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonFormField<String>(
        value: _selectedPlan,
        decoration: InputDecoration(
          suffixIcon: _selectedPlan != null
              ? IconButton(
            icon: const Icon(Icons.clear, color: Colors.grey),
            onPressed: () {
              setState(() => _selectedPlan = null);
              if (widget.onChanged != null) {
                widget.onChanged!(null);
              }
            },
          )
              : null,
          labelText: 'Plan',
          labelStyle: const TextStyle(color: Colors.black),
          hintText: 'Select a Plan',
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
        items: widget.planOptions.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() => _selectedPlan = value);
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
      ),
    );
  }
}
