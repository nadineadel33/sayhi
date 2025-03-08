import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'widgets/ProfileFormField.dart';
import 'widgets/EditButton.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  final TextEditingController _nameController = TextEditingController(text: "John Doe");
  final TextEditingController _emailController = TextEditingController(text: "johndoe@email.com");
  final TextEditingController _phoneController = TextEditingController(text: "+1 234 567 890");

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
    bool isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    Size size = MediaQuery.sizeOf(context);
    double width = size.width;
    double height = size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: const Color(0xff115bbf),
      ),
      body: Center(
        child: Container(
          width: isDesktop ? width * 0.5 : width * 0.9,
          height: isDesktop ? height * 0.7 : height * 0.8,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
                spreadRadius: 5,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile Picture Section 📷
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: isDesktop ? 60 : 50,
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
                const SizedBox(height: 20),

                // Profile Name Field 📝
                ProfileFormField(
                  controller: _nameController,
                  onChanged: (value) {},
                  hintText: "Enter your name",
                  obscureText: false,
                  label: "Full Name",
                ),
                const SizedBox(height: 15),

                // Email Field 📧
                ProfileFormField(
                  controller: _emailController,
                  onChanged: (value) {},
                  hintText: "Enter your email",
                  obscureText: false,
                  label: "Email Address",
                ),
                const SizedBox(height: 15),

                // Phone Number Field 📞
                ProfileFormField(
                  controller: _phoneController,
                  onChanged: (value) {},
                  hintText: "Enter your phone number",
                  obscureText: false,
                  label: "Phone Number",
                ),
                const SizedBox(height: 25),

                // Update Profile Button ✅
                EditButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Profile Updated Successfully!")),
                    );
                  },
                  // text: "Update Profile",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
