import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';

import 'footer.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map?>(
      future: initializeAppLovinSdk(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
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
      return await AppLovinMAX.initialize(
          "gDGoBe0xge_SkvPvT1ReUxgR1EPNApcT3y0_3WOIM66a2bD4MofTGDEX7UW28uyksndDt5uwHSB9ukck7w2xqB");
    } catch (error) {
      print("Error initializing AppLovin SDK: $error");
      return null;
    }
  }
}
