import 'package:chat_app/constents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../blocs/auth_bloc.dart';
import '../cubits/chat_cubit/chat_cubit.dart';
import '../helpers/showsnackbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformfeild.dart';
import 'chatscreen.dart';


class LoginScreen extends StatelessWidget {
  static String id = 'Login';
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is LoginLoading){

          isLoading=true;
        }else if(state is LoginSuccess){
          showSnackBar(context, state.message);
          BlocProvider.of<ChatCubit>(context).getMessage();
          isLoading = false;

          Navigator.pushNamed(context, ChatScreen.id,
              arguments: emailController.text);


        }else if(state is LoginFailed){

          showSnackBar(context, state.message);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          progressIndicator: const CircularProgressIndicator(
            color: KPrimaryColor,
          ),
          color: KPrimaryColor,
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
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
                                      'Hello, Welcome Back',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24,
                                          fontFamily: 'Poppins'),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Happy to see you again, to use your\naccount please login first.',
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
                                child: Image.asset(
                                  'assets/images/two.png',
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
                          height: 10,
                        ),
                        CustomTextFormField(
                          icon: IconlyLight.password,
                          controller: passwordController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                            text: 'Login',
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                BlocProvider.of<AuthBloc>(context).add(LoginEvent(email: emailController.text, password: passwordController.text));

                              }
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account ? "),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(color: Color(0xFF771F98)),
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
        );
      },
    );
  }


}
