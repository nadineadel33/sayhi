import 'package:flutter/material.dart';
import 'package:sayHI/Views/AboutView/AboutView.dart';
import 'package:sayHI/Views/AuthView/Register.dart';
import 'package:sayHI/Views/AuthView/SignIn.dart';
import 'package:sayHI/Views/ContactView/ContactView.dart';
import 'package:sayHI/Views/HomeView/HomeView.dart';
import 'package:sayHI/Views/ProfileView/ProfileView.dart';
import 'package:sayHI/Views/SettingsView/SettingsView.dart';


class SideMenu extends StatelessWidget {
  final Function(Widget) onPageSelected;
  final double menuWidth;

  const SideMenu({Key? key, required this.onPageSelected, this.menuWidth = 250}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> menuItems = [
      {"title": "Home", "icon": Icons.home, "page": const HomeView()},
      {"title": "About Us", "icon": Icons.info, "page": const AboutView()},
      {"title": "Contact Us", "icon": Icons.contact_mail, "page": const ContactView()},
      {"title": "Profile", "icon": Icons.person, "page": const ProfileView()},
      {"title": "Sign In", "icon": Icons.login, "page": const SignIn()},
      {"title": "Register", "icon": Icons.app_registration, "page": const Register()},
      {"title": "Settings", "icon": Icons.settings, "page": const SettingsView()},
    ];

    return Drawer(
      width: menuWidth,
      backgroundColor: Colors.blueGrey[900],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "sayHI",
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(color: Colors.white54),
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return _buildMenuButton(
                  title: menuItems[index]["title"],
                  icon: menuItems[index]["icon"],
                  page: menuItems[index]["page"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton({required String title, required IconData icon, required Widget page}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
      onTap: () => onPageSelected(page),
    );
  }
}
