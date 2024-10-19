import 'package:flutter/material.dart';
import 'package:myblocdemo/App/data/provider/api_provider_dio.dart';
import 'package:myblocdemo/App/data/provider/app_interceptor.dart';
import 'package:myblocdemo/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApiProviderDio.dio.interceptors.add(AppInterceptors());

  runApp(const MyApp());
}
