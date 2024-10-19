import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    // if (NetworkHelper.instance.hasConnection) {
    //   String? token = AppData.accessToken;
    //   // ignore: unnecessary_null_comparison
    //   if (token != null) {
    //     print("onRequest Token found");
    //     //ApiClient().setBaseToken(token: token);
    //     options.headers.addAll({"Authorization": "Bearer $token"});
    //   }
    //   return handler.next(options);
    // }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // if (response.statusCode == 401) {
    //   Map<String, dynamic> res = await ApiClient().refreshToken();

    //   String access_token = res['access'] ?? "";
    //   String refresh_token = res['refresh'] ?? "";

    //   await AppData.setAccessToken(access_token);
    //   await AppData.setRefreshToken(refresh_token);
    //   // Update the request header with the new access token
    //   response.requestOptions.headers['Authorization'] =
    //       'Bearer ${access_token}';

    //   // Repeat the request with the updated header
    //   return handler.resolve(await ApiClient().fetch(response.requestOptions));
    // }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
  }
}
