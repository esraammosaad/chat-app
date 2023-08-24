import 'package:chat_app/constents.dart';
import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/services/get_firestore_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/custom_textfield.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);


  static ScrollController scrollController = ScrollController();
  static String id = 'ChatScreen';
  List messageList=[];

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KPrimaryColor,
        title: const Text('Chat'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context,state){
                if(state is ChatSuccess){
                  messageList=state.messagesList;


                }


              },
              builder: (context, state) {

                return ListView.builder(
                    reverse: true,
                    controller: scrollController,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return messageList[index].email == email
                          ? ChatBubble(
                              message: messageList[index].message,
                            )
                          : ChatBubbleFriend(
                              message:messageList[index].message);
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomTextField(email: email),
          ),
        ],
      ),
    );
  }
}
