import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  final Function(String, String) onSignUp;

  SignUpScreen(this.onSignUp);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signUp() {
    widget.onSignUp(_emailController.text, _passwordController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Account Created Successfully!")),
    );
    Navigator.pop(context); // Go back to HomeScreen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: _emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _signUp, child: Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}




