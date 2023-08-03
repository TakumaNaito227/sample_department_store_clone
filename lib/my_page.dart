import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final List<String> boxItems = [
    'お知らせ',
    '履歴・先行チケット',
    'ちょっプル申込み',
    '抽選サンプル申込み',
    '先行チケット',
    'クーポン',
    'アプリ限定スタンプ',
    '登録情報',
    '登録情報の変更',
    '配送先の情報',
    'パスワードの変更',
    'メールアドレスの変更',
    'クレジットカードの変更',
    '設定',
    '設定・その他',
    'よくあるご質問',
    '特定商取引表示',
    '医薬品販売店舗',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        toolbarHeight: 100,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(left: 50.0, top: 50.0),
            child: Text('マイページ'),
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
            Container(
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                color: Colors.grey,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '会員登録でちょっプルポイントが貯まる・使える！',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'ログインする',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.pink),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: boxItems.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 40,
                  width: double.infinity,
                  color: _getBoxColor(index),
                  padding: const EdgeInsets.only(left: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      boxItems[index],
                      style: TextStyle(
                          fontSize: _getBoxFontSize(index),
                          color: Colors.black),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Color _getBoxColor(int index) {
    if (boxItems[index] == '履歴・先行チケット' ||
        boxItems[index] == '登録情報' ||
        boxItems[index] == '設定') {
      return Colors.grey;
    } else {
      return Colors.white;
    }
  }

  double _getBoxFontSize(int index) {
    if (boxItems[index] == '履歴・先行チケット' ||
        boxItems[index] == '登録情報' ||
        boxItems[index] == '設定') {
      return 10;
    } else {
      return 18;
    }
  }
}

void main() {
  runApp(const MaterialApp(home: MyPage()));
}
