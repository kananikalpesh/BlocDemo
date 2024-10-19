import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myblocdemo/App/models/users.dart';
import 'package:myblocdemo/App/screens/home_screen/bloc/home_screen_state.dart';
import 'package:myblocdemo/App/screens/home_screen/repository/home_screen_repository.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenLoadingState()) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        getUsersList();
      },
    );
  }

  final HomeScreenRepository homeScreenRepository = HomeScreenRepository();

  Future<void> getUsersList() async {
    try {
      Response? response = await homeScreenRepository.fetchPostApi();

      List<dynamic> responseData = response?.data;

      List<Users> dataList =
          responseData.map((item) => Users.fromJson(item)).toList();

      emit(HomeScreenLoadedState(dataList));
    } catch (e) {
      emit(HomeScreenErrorState(e.toString()));
    }
  }
}
