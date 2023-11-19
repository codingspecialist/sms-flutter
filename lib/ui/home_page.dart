import 'package:flutter/material.dart';
import 'package:smsapp/_core/http_util.dart';
import 'package:smsapp/data/sms_handler.dart';
import 'package:telephony/telephony.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final telephony = Telephony.instance;

  @override
  void initState() {
    super.initState();
  }

  Future<void> initPlatformState() async {
    final bool? result = await telephony.requestPhoneAndSmsPermissions;

    if (result != null && result) {
      telephony.listenIncomingSms(
          onNewMessage: onForegroundMessage, onBackgroundMessage: onBackgroundMessage);
    }

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("SMS APP")),
          Text("url"),
          TextFormField(),
          Text("url"),
          TextFormField(),
          ElevatedButton(onPressed: () async {
            await initPlatformState();
            url = "http://localhost:8080";
            apiKey = "123456";

            //await secureStorage.write(key: "url", value: "http://localhost:8080");
            //await secureStorage.write(key: "apiKey", value: "123456");
          }, child: Text("Sms수신 시작"),),
        ],
      ),
    );
  }
}