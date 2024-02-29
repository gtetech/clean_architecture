import 'package:clean_architecture/presentation/login/bloc/login_bloc.dart';
import 'package:clean_architecture/presentation/login/bloc/login_screen_events.dart';
import 'package:clean_architecture/presentation/login/bloc/login_screen_states.dart';
import 'package:clean_architecture/presentation/login/page/dummy_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailTextFieldController = TextEditingController();
  final passwordTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("Rebuilding");
    return BlocProvider<LoginBloc>(
      create: (BuildContext context) {
        return LoginBloc();
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: const Color(0xff242935),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Lets Sign you in',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'Welcome back,\nYou have been missed',
                    style: TextStyle(
                      color: Color(0xff898b94),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  BlocBuilder<LoginBloc, LoginScreenState>(
                      buildWhen: (oldState, newState) {
                    return (newState.states == LoginStates.validationErrors ||
                        oldState.states == LoginStates.validationErrors);
                  }, builder: (context, state) {
                    return MyTextField(
                        error: state.validationErrors?.emailError,
                        fieldHint: "Enter Your Email",
                        labelHint: "Email",
                        controller: emailTextFieldController);
                  }),
                  const SizedBox(
                    height: 18,
                  ),
                  BlocBuilder<LoginBloc, LoginScreenState>(
                      buildWhen: (oldState, newState) {
                    return (newState.states == LoginStates.validationErrors ||
                        oldState.states == LoginStates.validationErrors);
                  }, builder: (context, state) {
                    return MyTextField(
                        error: state.validationErrors?.passwordError,
                        fieldHint: "Enter Your Password",
                        labelHint: "Password",
                        isPassword: true,
                        controller: passwordTextFieldController);
                  }),
                  const SizedBox(
                    height: 6,
                  ),
                  const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Color(0xff898b94),
                          fontSize: 12,
                        ),
                      )),
                  const SizedBox(
                    height: 100,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        RichText(
                            text: const TextSpan(
                                style: TextStyle(
                                  color: Color(0xff898b94),
                                  fontSize: 14,
                                ),
                                text: "Don't have an account? ",
                                children: [
                              TextSpan(
                                  text: "Register",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14))
                            ])),
                        const SizedBox(
                          height: 30,
                        ),
                        BlocConsumer<LoginBloc, LoginScreenState>(
                            listener: (context, state) async {
                          final isError = state.states == LoginStates.error;
                          if (isError) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                "${state.errorMessage}",
                                style: const TextStyle(color: Colors.white),
                              ),
                              duration: const Duration(milliseconds: 300),
                            ));
                            return;
                          }

                          await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (builderContext) {
                              return BlocProvider.value(
                                value: context.read<LoginBloc>(),
                                child: const DummyScreen(),
                              );
                            }),
                          );
                        }, listenWhen: (oldState, newState) {
                          return newState.states == LoginStates.error ||
                              newState.states == LoginStates.success;
                        }, buildWhen: (oldstate, newstate) {
                          return (oldstate.states == LoginStates.loading ||
                              newstate.states == LoginStates.loading);
                        }, builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              final isEnabled =
                                  context.read<LoginBloc>().state.states !=
                                      LoginStates.loading;
                              if (isEnabled) {
                                context.read<LoginBloc>().add(
                                    LoginButtonTappedEvent(
                                        email: emailTextFieldController.text,
                                        password:
                                            passwordTextFieldController.text));
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 200,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color(0xff8d62ee),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Stack(
                                children: [
                                  if (context.watch<LoginBloc>().state.states ==
                                      LoginStates.loading)
                                    const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 4,
                                      ),
                                    )
                                  else
                                    const Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    )
                                ],
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
