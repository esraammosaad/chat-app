import 'package:chat_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);
  static String id = 'GetStarted';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 23.0,
                    right: 63,
                  ),
                  child: Text(
                    "Get Closer To\nEveryOne",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 23.0, right: 100),
                  child: Text(
                    "Helps you to contact everyone with just easy way",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Image.asset(
                    'assets/images/one.png',
                    width: 300,
                    height: 290,
                  ),
                ),
                CustomButton(
                  text: 'Get Started',
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpScreen.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
