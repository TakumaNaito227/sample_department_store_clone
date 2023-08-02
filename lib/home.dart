import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String title = 'サンプル百貨店';

  @override
  Widget build(BuildContext context) {
    const data = [
      Text('0'),
      Text('1'),
      Text('2'),
      Text('3'),
      Text('4'),
      Text('5'),
      Text('6'),
      Text('8'),
      Text('9'),
      Text('10'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.pink,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
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
        crossAxisAlignment: CrossAxisAlignment.stretch, // 横幅いっぱいに広げる
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMenuItem('限定'),
                _buildMenuItem('目玉商品'),
                _buildMenuItem('人気'),
                _buildMenuItem('先行'),
                _buildMenuItem('プレ先行'),
                _buildMenuItem('クーポン'),
                _buildMenuItem('抽選'),
                _buildMenuItem('履歴'),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: data.asMap().entries.map((entry) {
                int index = entry.key;
                Widget item = entry.value;
                Color color = index % 2 == 0 ? Colors.yellow : Colors.blue;
                return _buildColorfulBox(color, item);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title) {
    return InkWell(
      onTap: () {
        // タップされたときの処理を記述
      },
      child: Container(
        padding: const EdgeInsets.only(left: 12, right: 12),
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildColorfulBox(Color color, Widget child) {
    return Container(
      color: color,
      height: 100,
      child: Center(
        child: child,
      ),
    );
  }
}
