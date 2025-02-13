import 'package:flutter/material.dart';
import 'success_screen.dart';

class SignInScreen extends StatefulWidget {
  final String? email;
  final String? password;

  const SignInScreen(this.email, this.password);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signIn() {
    if (_emailController.text == widget.email && _passwordController.text == widget.password) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SuccessScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid Credentials!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: _emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _signIn, child: Text("Sign In"))
          ],
        ),
      ),
    );
  }
}
