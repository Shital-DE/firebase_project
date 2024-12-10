import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series_app/main.dart';
import 'package:firebase_series_app/user/signup.dart';
import 'package:firebase_series_app/widgets/ui_helper.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          "Login",
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
                    login(
                        email: emailController.text,
                        password: passwordController.text);
                  },
                  text: 'Login')),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Already have an account?',
              style: TextStyle(fontSize: 16),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()));
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ))
          ])
        ],
      ),
    );
  }

  login({required String email, required String password}) async {
    if (email == '' && password == '') {
      UiHelper.customALertBox(context: context, text: 'Enter required fields');
    } else {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyHomePage(title: 'Home page')));
        });
      } on FirebaseAuthException catch (e) {
        UiHelper.customALertBox(context: context, text: e.code.toString());
      }
    }
  }
}
