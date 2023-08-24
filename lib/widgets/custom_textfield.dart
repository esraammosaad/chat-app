import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import '../constents.dart';
import '../screens/chatscreen.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({
    super.key,required this.email
  });
 final TextEditingController? controller=TextEditingController();
 var email;

  @override
  Widget build(BuildContext context) {

    return TextField(
      controller: controller,
        onSubmitted: (value) async {
        print(value);

        await BlocProvider.of<ChatCubit>(context).sendMessage(message: value, email: email);
        controller!.clear();




        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon:  const Icon(
              IconlyBold.send,
              color: KPrimaryColor,
            ),
            onPressed: ()async {
              await BlocProvider.of<ChatCubit>(context).sendMessage(message: controller!.text, email: email);
              controller!.clear();




            },
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: KPrimaryColor)),
          hintText: 'Send Message',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: KPrimaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: KPrimaryColor)),
        ));
  }
}
