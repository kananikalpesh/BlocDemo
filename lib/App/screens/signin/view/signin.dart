import 'package:myblocdemo/App/routes/app_routes.dart';
import 'package:myblocdemo/App/screens/signin/bloc/signin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myblocdemo/App/widgets/app_textfield.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              BlocBuilder<SigninBloc, SigninState>(
                builder: (context, state) {
                  if (state is SigninErrorState) {
                    return Text(
                      state.errorMessage,
                      style: const TextStyle(color: Colors.red),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              AppTextField(
                controller: emailController,
                hintText: "Enter Email Address",
                onChanged: (p0) {
                  BlocProvider.of<SigninBloc>(context).add(
                      SigninTextChangeEvent(
                          emailController.text, passwordController.text));
                },
              ),
              const SizedBox(
                height: 15,
              ),
              AppTextField(
                controller: passwordController,
                onChanged: (p0) {
                  BlocProvider.of<SigninBloc>(context).add(
                      SigninTextChangeEvent(
                          emailController.text, passwordController.text));
                },
                hintText: "Enter password",
              ),
              const SizedBox(
                height: 15,
              ),
              BlocConsumer<SigninBloc, SigninState>(
                listener: (context, state) {
                  if (state is SigninSuccessState) {
                    Navigator.pushNamed(context, Routes.homeScreen);
                  }
                },
                builder: (context, state) {
                  if (state is SigninLoadingState) {
                    Future.delayed(
                      Duration(seconds: 2),
                      () {
                        BlocProvider.of<SigninBloc>(context)
                            .add(SigninSuccessEvent());
                      },
                    );

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return MaterialButton(
                    onPressed: () {
                      if (state is SigninValidState) {
                        BlocProvider.of<SigninBloc>(context).add(
                            SigninSubmittedEvent(
                                emailController.text, passwordController.text));

                        ///Cubit ma direct function call thache
                      }
                    },
                    color:
                        (state is SigninValidState) ? Colors.blue : Colors.grey,
                    child: const Text("Sign In"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
