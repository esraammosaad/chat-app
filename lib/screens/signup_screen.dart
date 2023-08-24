import 'package:chat_app/blocs/auth_bloc.dart';
import 'package:chat_app/constents.dart';
import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../helpers/showsnackbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformfeild.dart';
import 'chatscreen.dart';

class SignUpScreen extends StatelessWidget {
  static String id = 'SignUpScreen';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          isLoading = true;
        } else if (state is SignUpSuccess) {
          showSnackBar(context, state.message);
          BlocProvider.of<ChatCubit>(context).getMessage();
          isLoading = false;

          Navigator.pushNamed(context, ChatScreen.id,
              arguments: emailController.text);
        } else if (state is SignUpFailed) {
          showSnackBar(context, state.message);
          isLoading = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        color: KPrimaryColor,
        progressIndicator: const CircularProgressIndicator(
          color: KPrimaryColor,
        ),
        inAsyncCall: isLoading,
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16,
                left: 8,
              ),
              child: Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            IconlyLight.arrow_left_circle,
                            size: 32,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 12.0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hello,',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30,
                                        fontFamily: 'Poppins'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Please Enter your data to\nsign up.',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        fontFamily: 'Poppins'),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text('Email Address',
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.end),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 54.0,
                                ),
                                child: Image.asset(
                                  'assets/images/two.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomTextFormField(
                        icon: IconlyLight.user_1,
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(
                          'Password',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextFormField(
                        icon: IconlyLight.password,
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          text: 'Sign Up',
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              BlocProvider.of<AuthBloc>(context).add(
                                  SignUpEvent(
                                      email: emailController.text,
                                      password: passwordController.text));
                            }
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account ? '),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  LoginScreen.id,
                                );
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(color: KPrimaryColor),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
