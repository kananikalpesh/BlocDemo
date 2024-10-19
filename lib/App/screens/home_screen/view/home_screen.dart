import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myblocdemo/App/models/users.dart';
import 'package:myblocdemo/App/screens/home_screen/bloc/home_screen_cubit.dart';
import 'package:myblocdemo/App/screens/home_screen/bloc/home_screen_state.dart';

import 'package:myblocdemo/App/widgets/snack_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
          ///Cubit ma direct function call thache
          /// cubit kkoi event send kar va mate direct function call kar va nu
          /// BlocProvider.of<HomeScreenCubit>(context).getUsersList();

          if (state is HomeScreenLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeScreenLoadedState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                Users users = state.userslist[index];
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "ID :",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              users.id.toString(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Title :",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          users.title.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black45),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Discription :",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          users.body.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: state.userslist.length,
            );
          } else if (state is HomeScreenErrorState) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const Center(
              child: Text(
                "en error occur",
                style: TextStyle(color: Colors.red),
              ),
            );
          }
        },
        listener: (context, state) {
          if (state is HomeScreenErrorState) {
            return errorMessage(context, state.errorMessage);
          }
        },
      )),
    );
  }
}
