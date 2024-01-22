import 'package:flutter/material.dart';
import 'package:smec/controllers/authController.dart';
import 'package:smec/views/Home/home.dart';
import 'package:smec/views/auth/login.dart';
import 'package:smec/views/common/loader.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthController _authController = AuthController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();
  bool isLoading = false;

  // Function to handle navigation after sign-up
  void _navigateToSignIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _displayNameController,
              decoration: InputDecoration(labelText: 'Display Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            isLoading
                ? CustomLoader()
                : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      // await _authController.signUpWithEmailAndPassword(
                      // _emailController.text,
                      // _passwordController.text,
                      // _displayNameController.text,
                      // );

                      bool signUpResult =
                          await _authController.signUpWithEmailAndPassword(
                        _emailController.text,
                        _passwordController.text,
                        _displayNameController.text,
                      );

                      if (signUpResult) {
                        // Sign-up was successful
                        print("Sign-up successful");
                        _navigateToSignIn();
                        setState(() {
                          isLoading = false;
                        });
                      } else {
                        // Sign-up failed
                        print("Sign-up failed");
                        setState(() {
                          isLoading = false;
                        });
                      }

                      // Navigate to the home screen after successful sign-up
                    },
                    child: Text('Sign Up'),
                  ),
          ],
        ),
      ),
    );
  }
}
