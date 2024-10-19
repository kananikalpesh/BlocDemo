import 'package:myblocdemo/App/models/users.dart';

sealed class HomeScreenState {}

class HomeScreenLoadingState extends HomeScreenState {}

class HomeScreenLoadedState extends HomeScreenState {
  List<Users> userslist;

  HomeScreenLoadedState(this.userslist);
}

class HomeScreenErrorState extends HomeScreenState {
  final String errorMessage;
  HomeScreenErrorState(this.errorMessage);
}
