import 'package:flutter/material.dart';

class AddEmailButton extends StatefulWidget {
  const AddEmailButton({super.key});

  @override
  State<AddEmailButton> createState() => _AddEmailButtonState();
}

class _AddEmailButtonState extends State<AddEmailButton> {
  final TextEditingController _emailController = TextEditingController();

  void _showAddEmailDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add Email Address"),
        content: TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "Enter your email",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel", style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: _addEmail,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff115bbf),
            ),
            child: const Text("Add", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _addEmail() {
    String email = _emailController.text.trim();

    if (email.isNotEmpty && email.contains('@')) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Email '$email' added successfully!"),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid email address!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: const Color(0xff115bbf).withOpacity(0.1),
        surfaceTintColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      onPressed: _showAddEmailDialog,
      child: const Text(
        '+ Add Email Address',
        style: TextStyle(color: Color(0xff115bbf)),
      ),
    );
  }
}
