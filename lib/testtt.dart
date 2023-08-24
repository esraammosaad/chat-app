//
//
// import 'package:chat_app/constents.dart';
// import 'package:chat_app/models/message_model.dart';
// import 'package:chat_app/services/get_firestore_data.dart';
// import 'package:flutter/material.dart';
// import '../widgets/chat_bubble.dart';
// import '../widgets/custom_textfield.dart';
//
// class CahtScreen extends StatefulWidget {
//   const CahtScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CahtScreen> createState() => _CahtScreenState();
// }
//
// class _CahtScreenState extends State<CahtScreen> {
//   List<MessageModel>messages=[];
//   bool isLoading=true;
//
//   getData()async{
//     messages=await getMessages();
//     isLoading=false;
//     setState(() {
//
//     });
//   }
//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: KPrimaryColor,
//         title: const Text('Caht'),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//                 itemCount: messages.length,
//                 itemBuilder: (cnotext, index) {
//                   return ChatBubble(message: messages[index].message,);
//                 }),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: customeTextField(),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
