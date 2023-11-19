import 'package:smsapp/_core/http_util.dart';
import 'package:smsapp/data/sms_handler.dart';

class SmsRepository {
  static final SmsRepository _instance = SmsRepository._single();

  factory SmsRepository() {
    return _instance;
  }

  SmsRepository._single();

  Future<void> redirectSms(String msg) async {
    String? url = await secureStorage.read(key: "url");
    String? apiKey = await secureStorage.read(key: "apiKey");
    print("메시지 api로 전송됨 : ${url}");
    print("메시지 api로 전송됨 : ${apiKey}");
    print("메시지 api로 전송됨 : ${msg}");
  }
}