import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
        backgroundColor: const Color(0xff115bbf),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About Our App",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "SayHi is an AI-powered sign language translator that helps bridge communication gaps between sign language users and non-signers.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "App Version: 1.0.0",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Developed by: sayHI Team",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            Text(
              "Contact Us: support@sayhiapp.com",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
