import 'package:flutter/material.dart';

class Featured extends StatelessWidget {
  const Featured({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        toolbarHeight: 100,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(left: 50.0, top: 50.0),
            child: Text('特集一覧'),
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
      body: const Center(
        child: Text('特集一覧の内容をここに表示する'),
      ),
    );
  }
}
