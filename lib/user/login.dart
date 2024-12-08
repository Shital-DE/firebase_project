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
          "Login page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
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
              child: UiHelper.customButton(voidCallBack: () {}, text: 'Login'))
        ],
      ),
    );
  }
}
