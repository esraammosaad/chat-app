import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/animation.dart';
import 'package:meta/meta.dart';
import '../../constents.dart';
import '../../models/message_model.dart';
import '../../screens/chatscreen.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference<Map<String, dynamic>> messages =
      FirebaseFirestore.instance.collection(KCollectionName);



  sendMessage({required String message, required String email}) async {
    await messages.add(
        MessageModel(message: message, createdAt: DateTime.now(), email: email)
            .toJson());
    ChatScreen.scrollController.animateTo(
      0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );

  }

   getMessage() {
    List<MessageModel> messagesList = [];

    messages.orderBy('createdAt', descending: true).snapshots().listen((event) {
      messagesList.clear();
      for (int i = 0; i <event.docs.length; i++) {


        messagesList.add(MessageModel.fromJson(event.docs[i]));


      }
      emit(ChatSuccess(messagesList: messagesList));
    });

  }
}
