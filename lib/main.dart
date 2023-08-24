import 'package:chat_app/blocs/auth_bloc.dart';
import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/cubits/signup_cubit/sign_up_cubit.dart';
import 'package:chat_app/screens/chatscreen.dart';
import 'package:chat_app/screens/get_started_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/login_cubit/login_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


   runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<SignUpCubit>(create: (context)=>SignUpCubit()),
        // BlocProvider<LoginCubit>(create: (context)=>LoginCubit()),
        BlocProvider<AuthBloc>(create:(context)=> AuthBloc()),
        BlocProvider<ChatCubit>(create: (context)=>ChatCubit()),




      ],
      child: MaterialApp(
        routes: {
          ChatScreen.id: (context) => ChatScreen(),
          GetStarted.id: (context) => const GetStarted(),
          SignUpScreen.id:(context)=>SignUpScreen(),
          LoginScreen.id:(context)=>LoginScreen(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: GetStarted.id,
      ),
    );
  }
}
