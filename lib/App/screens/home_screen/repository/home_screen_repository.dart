import 'package:dio/dio.dart';
import 'package:myblocdemo/App/data/constants/api_config.dart';
import 'package:myblocdemo/App/data/provider/api_provider_dio.dart';
import 'package:myblocdemo/App/data/provider/dio_exeception.dart';

class HomeScreenRepository {
  Future<Response?> fetchPostApi() async {
    try {
      Response? response =
          await ApiProviderDio.instance.get(ApiConfig.postsApi);

      // print({"da >>>>>>>>>", response});
      return response;
    } on DioException catch (e) {
      throw DioExceptions.fromDioError(e).message;
    }
  }
}
