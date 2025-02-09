import 'package:flutter/material.dart';

class CountryWidget extends StatefulWidget {
  const CountryWidget({super.key});

  @override
  State<CountryWidget> createState() => _CountryWidgetState();
}

class _CountryWidgetState extends State<CountryWidget> {
  final List<String> _countries = [
    'Egypt', 'USA', 'Canada', 'Germany', 'France', 'India', 'Japan', 'Brazil', 'Australia', 'UK'
  ];
  String? _selectedCountry;
  final TextEditingController _searchController = TextEditingController();

  void _showCountryPickerDialog() {
    showDialog(
      context: context,
      builder: (context) {
        List<String> filteredCountries = List.from(_countries);

        return StatefulBuilder(
          builder: (context, setState) {
            void _filterCountries(String query) {
              setState(() {
                filteredCountries = _countries
                    .where((country) =>
                    country.toLowerCase().contains(query.toLowerCase()))
                    .toList();
              });
            }

            return AlertDialog(
              title: const Text("Select Your Country"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Search country...",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: _filterCountries,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: filteredCountries.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(filteredCountries[index]),
                          onTap: () {
                            setState(() {
                              _selectedCountry = filteredCountries[index];
                            });
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        readOnly: true,
        onTap: _showCountryPickerDialog,
        decoration: InputDecoration(
          labelText: 'Country',
          labelStyle: const TextStyle(color: Colors.black),
          hintText: 'Select Country',
          hintStyle: const TextStyle(fontSize: 12, color: Color(0xff115bbf)),
          suffixIcon: const Icon(Icons.arrow_drop_down, color: Color(0xff115bbf)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xff115bbf)),
          ),
        ),
        controller: TextEditingController(text: _selectedCountry),
      ),
    );
  }
}
