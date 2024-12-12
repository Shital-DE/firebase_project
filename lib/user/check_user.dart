import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series_app/main.dart';
// import 'package:firebase_series_app/user/login.dart';
import 'package:firebase_series_app/user/phone_auth.dart';
import 'package:flutter/material.dart';

class CheckUser extends StatelessWidget {
  const CheckUser({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return const MyHomePage(title: 'Home page');
        } else {
          return const PhoneAuth();
          // const LoginPage();
        }
      },
    );
  }
}
