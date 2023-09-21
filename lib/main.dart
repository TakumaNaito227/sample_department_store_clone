import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Footer.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // FlutterとiOSのコミュニケーション用チャネル
  final MethodChannel _channel =
      const MethodChannel('com.sample.sample/sample');

  // ネイティブ画面の表示を要求するメソッド
  Future _launchNativeScreen() async {
    await _channel.invokeMethod('sample');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map?>(
      future: initializeAppLovinSdk(), // AppLovin MAX SDK の初期化
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            // AppLovin SDK の初期化でエラーが発生した場合のエラーメッセージを表示
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Error',
              home: Scaffold(
                body: Center(
                  child: Text(
                      'An error occurred while initializing the AppLovin SDK.'),
                ),
              ),
            );
          } else {
            // AppLovin SDK の初期化が成功した場合、アプリのメイン画面を表示
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: const Scaffold(
                body: Home(),
                bottomNavigationBar: Footer(),
              ),
            );
          }
        } else {
          // AppLovin SDK の初期化中、ローディングインジケーターを表示
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Loading',
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }

  Future<Map?> initializeAppLovinSdk() async {
    try {
      // AppLovin MAX SDK を初期化するための非同期メソッド
      return await AppLovinMAX.initialize(
          "gDGoBe0xge_SkvPvT1ReUxgR1EPNApcT3y0_3WOIM66a2bD4MofTGDEX7UW28uyksndDt5uwHSB9ukck7w2xqB");
    } catch (error) {
      print("Error initializing AppLovin SDK: $error");
      return null;
    }
  }


