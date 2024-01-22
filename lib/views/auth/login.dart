import 'package:flutter/material.dart';
import 'package:smec/controllers/authController.dart';
import 'package:smec/views/Home/home.dart';
import 'package:smec/views/auth/signup.dart';
import 'package:smec/views/common/loader.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthController _authController = AuthController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  // Function to handle navigation to the sign-up screen
  void _navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                      // await _authController.signInWithEmailAndPassword(
                      // _emailController.text,
                      // _passwordController.text,
                      // );
                      bool signInResult =
                          await _authController.signInWithEmailAndPassword(
                        _emailController.text,
                        _passwordController.text,
                      );

                      if (signInResult) {
                        // Sign-in was successful
                        print("Sign-in successful");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomeScreen()),
                        );
                        setState(() {
                          isLoading = false;
                        });
                      } else {
                        // Sign-in failed
                        print("Sign-in failed");
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    child: Text('Sign In'),
                  ),
            SizedBox(height: 10),
            TextButton(
              onPressed: _navigateToSignUp,
              child: Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
