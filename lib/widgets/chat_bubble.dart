import 'package:flutter/material.dart';

import '../constents.dart';

class ChatBubble extends StatelessWidget {
   ChatBubble({
    super.key,required this.message
  });
  String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 8, bottom: 3, top: 8, right: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(color: KPrimaryColor),

            // color: KPrimaryColor,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child:  Text(message),
      ),
    );
  }
}
class ChatBubbleFriend extends StatelessWidget {
  ChatBubbleFriend({
    super.key,required this.message
  });
  String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(left: 8, bottom: 3, top: 8, right: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: KPrimaryColor,
            border: Border.all(color: KPrimaryColor),

            // color: KPrimaryColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child:  Text(message),
      ),
    );
  }
}
