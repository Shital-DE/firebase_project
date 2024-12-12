import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series_app/user/otp_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/ui_helper.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text(
            "Phone authentication",
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
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Enter phone number',
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
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: '+917972858760',
                  // phoneController.text,
                  verificationCompleted:
                      (PhoneAuthCredential credential) async {
                    await FirebaseAuth.instance
                        .signInWithCredential(credential);
                  },
                  verificationFailed: (FirebaseException e) {},
                  codeSent: (String verificationId, int? resendToken) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OTPScreen(verificationId: verificationId),
                      ),
                    );
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );
              } catch (e) {
                print('Error during phone verification: $e');
              }

              // FirebaseAuth.instance.verifyPhoneNumber(
              //     verificationCompleted: (PhoneAuthCredential credential) {},
              //     verificationFailed: (FirebaseException e) {},
              //     codeSent: (String verificationid, int? resendToken) {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => OTPScreen(
              //                     verificationId: verificationid,
              //                   )));
              //     },
              //     codeAutoRetrievalTimeout: (String verificationId) {},
              //     phoneNumber: phoneController.text);
            },
            text: 'Verify phone number',
          )),
        ]));
  }
}
