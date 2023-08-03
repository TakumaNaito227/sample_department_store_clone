import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  // 状態管理用の変数
  int selectedIndex = 0;

  // 下の大きい要素の内容を格納するリスト
  final List<String> bigItems = [
    '受付中',
    '先行',
    'すべて',
  ];

  // 要素の選択状態を表すリスト（初期値はすべてがfalse）
  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        toolbarHeight: 100,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(left: 50.0, top: 50.0),
            child: Text('お気に入り'),
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
      body: Column(
        children: [
          // 横並びの要素を表示する部分
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                    _updateSelectedState(0);
                  });
                },
                child: _buildSmallItem(0, isSelected[0]),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                    _updateSelectedState(1);
                  });
                },
                child: _buildSmallItem(1, isSelected[1]),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                    _updateSelectedState(2);
                  });
                },
                child: _buildSmallItem(2, isSelected[2]),
              ),
            ],
          ),
          // 下の大きい要素を表示する部分
          Expanded(
            child: Center(
              child: Text(
                bigItems[selectedIndex],
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 横並びの要素を作成するメソッド
  Widget _buildSmallItem(int index, bool selected) {
    String selectItem = bigItems[index];
    Color backgroundColor = selected ? Colors.yellow : Colors.grey;

    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      width: 100,
      height: 50,
      color: backgroundColor,
      child: Center(
        child: Text(selectItem),
      ),
    );
  }

  // 選択状態を更新するメソッド
  void _updateSelectedState(int index) {
    for (int i = 0; i < isSelected.length; i++) {
      isSelected[i] = (i == index);
    }
  }
}
