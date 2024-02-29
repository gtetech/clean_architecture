import 'package:clean_architecture/presentation/login/bloc/login_bloc.dart';
import 'package:clean_architecture/presentation/login/bloc/login_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
              children: [
          Text("Message from login screen = ${context.read<LoginBloc>().state.successMessage}",style: TextStyle(fontSize: 22),)],
      )
      ,
      ),
    );
  }
}
