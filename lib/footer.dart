import 'package:flutter/material.dart';

import 'favorites.dart';
import 'featured.dart';
import 'home.dart';
import 'my_page.dart';
import 'search.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    // 各画面のウィジェット
    const Home(),
    const Search(),
    const Favorites(),
    const Featured(),
    const MyPage()
  ];

  @override
  Widget build(BuildContext context) {
    print(_pages);
    print(_currentIndex);
    print(_pages[_currentIndex]);
    print('===========================');

    return Scaffold(
      body: _pages[_currentIndex], // 現在の画面を表示する
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '検索'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'お気に入り'),
          BottomNavigationBarItem(icon: Icon(Icons.hexagon), label: '特集'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'マイページ'),
        ],
        currentIndex: _currentIndex, // 現在選択中のアイテムのインデックス
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          // アイテムが選択されたときの処理
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
