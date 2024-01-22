import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign up with email and password
// Sign up with email, password, and username
  Future<bool> signUpWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store additional user information in Cloud Firestore
      await _storeUserInfo(userCredential.user!.uid, username, email);

      // You can also save user information locally using SharedPreferences if needed
      await _saveUserInfoLocally(username, email);

      // If sign-up is successful, return true
      return true;
    } catch (e) {
      print("Error during sign up: $e");
      // Handle sign-up errors
      _handleError(e);
      // If sign-up fails, return false
      return false;
    }
  }

  // Sign in with email and password
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // If sign-in is successful, return true
      return true;
    } catch (e) {
      print("Error during sign in: $e");
      // Handle sign-in errors
      _handleError(e);
      // If sign-in fails, return false
      return false;
    }
  }

  // Store user information in Cloud Firestore
  Future<void> _storeUserInfo(
      String userId, String username, String email) async {
    await _firestore.collection('users').doc(userId).set({
      'username': username,
      'email': email,
      // Add more fields as needed
    });
  }

  // Save user information locally using SharedPreferences
  Future<void> _saveUserInfoLocally(String username, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('email', email);
    // Add more fields as needed
  }

  // Handle errors and display a toast message
  void _handleError(dynamic error) {
    String errorMessage = "An error occurred";
    if (error is FirebaseAuthException) {
      errorMessage = error.message!;
    }
    Fluttertoast.showToast(
      msg: errorMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  // Reset password using email
  Future<void> resetPassword(String email) async {
    try {
      // Check if the email exists in the database
      bool emailExists = await _isEmailExists(email);
      if (!emailExists) {
        Fluttertoast.showToast(
          msg: "Email not registered. Please sign up.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }

      await _auth.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(
        msg: "Password reset email sent to $email",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (e) {
      print("Error during password reset: $e");
      // Handle reset password errors
      _handleError(e);
    }
  }

  // Check if the email exists in the database
  Future<bool> _isEmailExists(String email) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }
}
