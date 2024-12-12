import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../widgets/ui_helper.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text(
            "Forgot password",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: SizedBox(
                width: 400,
                child: UiHelper.customTextField(
                    controller: emailController,
                    text: 'Email',
                    icondata: Icons.mail,
                    toHide: false)),
          ),
          const SizedBox(height: 10),
          Center(
              child: UiHelper.customButton(
                  voidCallBack: () {
                    forgotPassword(email: emailController.text);
                  },
                  text: 'Reset password')),
        ]));
  }

  forgotPassword({required String email}) async {
    if (email == '') {
      UiHelper.customALertBox(
          context: context, text: 'Enter an email to reset password.');
    } else {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }
}
