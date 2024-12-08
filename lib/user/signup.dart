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
              child:
                  UiHelper.customButton(voidCallBack: () {}, text: 'Sign Up')),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  signUp({required String email, required String password}) async {}
}
