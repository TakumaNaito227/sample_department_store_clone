import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

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
            // ここに新しいコンテナを追加
            Container(
              color: Colors.yellow, // 任意の色を設定
              height: 100,
              width: double.infinity,
              child:
                  const Center(child: Text('広告枠', textAlign: TextAlign.center)),
            ),
            const SizedBox(height: 10), // 要素との間隔を設定
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
