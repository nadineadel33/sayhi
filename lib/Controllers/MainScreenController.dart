import 'package:flutter/material.dart';

class MainScreenController extends StatelessWidget {
  const MainScreenController({Key? key}) : super(key: key);

  void _navigateTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SayHI"), backgroundColor: const Color(0xff115bbf)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildNavigationTile(context, "🏠 Home", "/home"),
          _buildNavigationTile(context, "ℹ️ About", "/about"),
          _buildNavigationTile(context, "📞 Contact", "/contact"),
          _buildNavigationTile(context, "👤 Profile", "/profile"),
          _buildNavigationTile(context, "🔐 Sign In", "/signin"),
          _buildNavigationTile(context, "📝 Register", "/register"),
          _buildNavigationTile(context, "⚙️ Settings", "/settings"),
        ],
      ),
    );
  }

  Widget _buildNavigationTile(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () => _navigateTo(context, route),
    );
  }
}
