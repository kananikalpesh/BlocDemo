import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myblocdemo/App/routes/app_routes.dart';
import 'package:myblocdemo/App/screens/home_screen/bloc/home_screen_cubit.dart';
import 'package:myblocdemo/App/screens/home_screen/view/home_screen.dart';
import 'package:myblocdemo/App/screens/signin/bloc/signin_bloc.dart';
import 'package:myblocdemo/App/screens/signin/view/signin.dart';

abstract class RouteNavigator {
  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.homeScreen: (BuildContext context) => BlocProvider(
          create: (context) => HomeScreenCubit(),
          child: const HomeScreen(),
        ),
    Routes.signin: (BuildContext context) => BlocProvider(
          create: (context) => SigninBloc(),
          child: const Signin(),
        )
  };
}
