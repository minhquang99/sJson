import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:searchjson/widget/champions_page.dart';
import 'package:searchjson/widget/detail_champ_page.dart';
import 'package:searchjson/network.dart';
import 'package:searchjson/model/champ.dart';
import 'package:searchjson/widget/items_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final tabs = [
    ChampionsPage(),
    ChampionsPage(),
    ChampionsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff010913),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Color(0xfffebbc6f),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xfff121212),
        items: [
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 14,
              backgroundImage: AssetImage("assets/images/icon/helmet.png"),
            ),
            label: 'Quân tướng',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 18,
              backgroundImage: AssetImage("assets/images/icon/riot.png"),
            ),
            label: 'Chiến thuật',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 16,
              backgroundImage: AssetImage("assets/images/icon/sword.png"),
            ),
            label: 'Trang bị',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
