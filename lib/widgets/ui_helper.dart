import 'package:flutter/material.dart';

class UiHelper {
  static customTextField(
      {required TextEditingController controller,
      required String text,
      required IconData icondata,
      required bool toHide}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
            hintText: text,
            suffixIcon: Icon(icondata),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
      ),
    );
  }

  static customButton(
      {required VoidCallback voidCallBack, required String text}) {
    return SizedBox(
      height: 50,
      width: 250,
      child: FilledButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25))),
          onPressed: () {
            voidCallBack();
          },
          child: Text(
            text,
            style: const TextStyle(fontSize: 20),
          )),
    );
  }

  static customALertBox({required BuildContext context, required String text}) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              text,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }
}
