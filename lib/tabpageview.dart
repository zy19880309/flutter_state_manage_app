import 'dart:core' as prefix0;
import 'dart:core';

import 'package:flutter/material.dart';

class TabDemoPage extends StatefulWidget {
  @override
  _TabDemoPageState createState() => _TabDemoPageState();
}

class _TabDemoPageState extends State<TabDemoPage> {
  List page = [];

  PageController _pageController;

  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page.add(Text("第一页"));
    page.add(Text("第二页"));
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("tab+pageview学习"),
        centerTitle: true,
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return page[index];
        },
        itemCount: 2,
        controller: _pageController,
        onPageChanged: _pageChange,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        items: [
          BottomNavigationBarItem(
              title: Text("首页"), icon: Icon(Icons.category)),
          BottomNavigationBarItem(title: Text("我的"), icon: Icon(Icons.message)),
        ],
        onTap: onTap,
      ),
    );
  }

  void _pageChange(int value) {
    if (value != _currentPage) {
      setState(() {
        _currentPage = value;
      });
    }
  }

  void onTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}
