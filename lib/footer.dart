import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Footer createState() => _Footer();
}

class _Footer extends State {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: '検索'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'お気に入り'),
        BottomNavigationBarItem(icon: Icon(Icons.hexagon), label: '特集'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'マイページ'),
      ],
      type: BottomNavigationBarType.fixed,
    );
  }
}
