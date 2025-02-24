import 'package:flutter/material.dart';
import '../../../GlobalWidgets/CustomFormField.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key, this.onTap});
  final void Function()? onTap;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscureText = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          width: 500,
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6), // Glass effect background
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Log in',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 32),

                // Social Logins
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialLoginButton('Assets/icons/Google.png', () {}),
                    _socialLoginButton('Assets/icons/Apple.png', () {}),
                    _socialLoginButton('Assets/icons/Facebook.png', () {}),
                  ],
                ),

                const SizedBox(height: 16),
                const Text('- Or log in via email -', style: TextStyle(color: Colors.white70)),
                const SizedBox(height: 16),

                // Email Field
                CustomFormField(
                  controller: _mailController,
                  onChanged: (value) {},
                  hintText: 'Enter your email',
                  obscureText: false,
                  label: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please enter your email';
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Password Field
                CustomFormField(
                  controller: _passwordController,
                  onChanged: (value) {},
                  hintText: 'Enter your password',
                  obscureText: obscureText,
                  label: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.white),
                    onPressed: () => setState(() => obscureText = !obscureText),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please enter your password';
                    return null;
                  },
                ),

                const SizedBox(height: 24),

                // Login Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform login
                    }
                  },
                  child: const Text('Log In', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),

                const SizedBox(height: 16),

                // Register Link
                TextButton(
                  onPressed: widget.onTap,
                  child: const Text('New here? Create Account', style: TextStyle(color: Colors.blue, fontSize: 14)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialLoginButton(String assetPath, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: IconButton(
        icon: Image.asset(assetPath, width: 30),
        iconSize: 40,
        onPressed: onPressed,
      ),
    );
  }
}
