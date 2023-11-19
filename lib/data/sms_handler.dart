import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smsapp/data/sms_repository.dart';
import 'package:telephony/telephony.dart';

String url = "";
String apiKey = "";

// 백그라운드 메시지 (반드시 최상단에 있어야 함)
void onBackgroundMessage(SmsMessage message) async {
  print("background meesage : ${message.body}");
  SmsRepository().redirectSms("background meesage : ${message.body}");
}

// 포그라운드 메시지
void onForegroundMessage(SmsMessage message) async {
  print("foreground meesage : ${message.body}");
  //print("meesage : ${message.address}");
  //print("meesage : ${message.date}");
  SmsRepository().redirectSms("foreground meesage : ${message.body}");
}