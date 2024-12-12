import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series_app/main.dart';
import 'package:flutter/material.dart';

import '../widgets/ui_helper.dart';

class OTPScreen extends StatefulWidget {
  final String verificationId;
  const OTPScreen({super.key, required this.verificationId});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text(
            "OTP verification screen",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: SizedBox(
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Enter the OTP',
                        suffixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24))),
                  ),
                )),
          ),
          const SizedBox(height: 30),
          Center(
              child: UiHelper.customButton(
            voidCallBack: () async {
              try {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: otpController.text);
                FirebaseAuth.instance
                    .signInWithCredential(credential)
                    .then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (conext) =>
                              const MyHomePage(title: 'My home page')));
                });
              } catch (e) {
                debugPrint(e.toString());
              }
            },
            text: 'OTP',
          )),
        ]));
  }
}
