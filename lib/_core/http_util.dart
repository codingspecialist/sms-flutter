import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final dio = Dio(
  BaseOptions(
    // baseUrl은 사용자 입력에 따라 변경됨
    contentType: "application/json; charset=utf-8",
  ),
);

// 앱이 종료되었다가 다시 켜졌을 때, 사용자가 입력해둔 URL과 APIKey 불러올 때 사용
const secureStorage = FlutterSecureStorage();