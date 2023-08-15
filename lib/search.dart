import 'dart:io' show Platform;

import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final String _bannerAdUnitId =
      Platform.isAndroid ? "af9668fd3e210dfe" : "d99ca2eff65ce8fd";

  @override
  void initializeBannerAds() {
    // Banners are automatically sized to 320x50 on phones and 728x90 on tablets
    AppLovinMAX.createBanner(_bannerAdUnitId, AdViewPosition.bottomCenter);
  }

  @override
  void initState() {
    super.initState();
    initializeBannerAds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        toolbarHeight: 100,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 5.0),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                // ショッピングカートが押されたときの処理を追加
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      color: Colors.blue,
                      height: 100,
                      child: const Center(
                        child: Text(
                          '飲料',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      color: Colors.green,
                      height: 100,
                      child: const Center(
                        child: Text(
                          '食品',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      color: Colors.tealAccent,
                      height: 100,
                      child: const Center(
                        child: Text(
                          'ビューティ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      color: Colors.amberAccent,
                      height: 100,
                      child: const Center(
                        child: Text(
                          'ファッション',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      color: Colors.orangeAccent,
                      height: 100,
                      child: const Center(
                        child: Text(
                          'フルーツ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      color: Colors.pinkAccent,
                      height: 100,
                      child: const Center(
                        child: Text(
                          'スイーツ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            MaxAdView(
              adUnitId: _bannerAdUnitId,
              adFormat: AdFormat.banner,
              listener: AdViewAdListener(
                onAdLoadedCallback: (ad) {
                  // 広告が読み込まれたときの処理
                  print('広告が読み込まれたときの処理');
                },
                onAdLoadFailedCallback: (adUnitId, error) {
                  // 広告の読み込みが失敗したときの処理
                  print('広告の読み込みが失敗したときの処理');
                },
                onAdClickedCallback: (ad) {
                  // 広告がクリックされたときの処理
                  print('広告がクリックされたときの処理');
                },
                onAdExpandedCallback: (ad) {
                  // 広告が展開されたときの処理
                  print('広告が展開されたときの処理');
                },
                onAdCollapsedCallback: (ad) {
                  // 広告が閉じられたときの処理
                  print('広告が閉じられたときの処理');
                },
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) => Container(
                height: 50,
                color: Colors.grey,
                child: Center(
                  child: Text(
                    'ダミーデータ${index + 1}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
