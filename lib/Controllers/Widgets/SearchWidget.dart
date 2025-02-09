import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final double width;

  const SearchWidget({super.key, this.width = 300});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width,
        child: TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Colors.grey.withOpacity(0.3),
              ),
              borderRadius: BorderRadius.circular(50.0),
            ),
            prefixIcon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(Icons.search, color: Colors.grey, size: 25),
            ),
            hintText: 'Search...',
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: const Color(0xff091e3a),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
          textInputAction: TextInputAction.search,
        ),
      ),
    );
  }
}
