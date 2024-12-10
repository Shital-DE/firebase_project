import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series_app/main.dart';
import 'package:flutter/material.dart';

import '../widgets/ui_helper.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          "Sign Up",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
                width: 400,
                child: UiHelper.customTextField(
                    controller: emailController,
                    text: 'Email',
                    icondata: Icons.mail,
                    toHide: false)),
          ),
          Center(
            child: SizedBox(
                width: 400,
                child: UiHelper.customTextField(
                    controller: passwordController,
                    text: 'Password',
                    icondata: Icons.password,
                    toHide: true)),
          ),
          const SizedBox(height: 30),
          Center(
              child: UiHelper.customButton(
                  voidCallBack: () {
                    signUp(
                        email: emailController.text,
                        password: passwordController.text);
                  },
                  text: 'Sign Up')),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  signUp({required String email, required String password}) async {
    if (email == '' && password == '') {
      UiHelper.customALertBox(context: context, text: 'Enter required fields.');
    } else {
      // UserCredential? userCredential;
      try {
        // UserCredential? userCredential =
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyHomePage(title: 'Home page')));
          return null;
        });
      } on FirebaseAuthException catch (e) {
        UiHelper.customALertBox(context: context, text: e.code.toString());
      }
    }
  }
}
