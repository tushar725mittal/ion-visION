import 'package:flutter/material.dart';
import 'package:vision/pages/crypto.dart';
import 'package:vision/pages/investment_mode.dart';

import 'financial_news_page.dart';

class Invest_Page extends StatefulWidget {
  const Invest_Page({
    Key? key,
  }) : super(key: key);

  @override
  State<Invest_Page> createState() => _Invest_PageState();
}

class _Invest_PageState extends State<Invest_Page> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.animateToPage(index,
        duration: Duration(microseconds: 1000), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [InvestmentMode(), financial_news_Page(), Crypto_Page()],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          unselectedItemColor: Colors.white,
          backgroundColor: Color(0xFF005483),
          selectedItemColor: Colors.white,
          selectedFontSize: 12,
          enableFeedback: true,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(
                  width: 30,
                  height: 30,
                  child: Image.asset("assets/images/invest_logo.png")),
              label: 'Investment Mode',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  width: 30,
                  height: 30,
                  child: Image.asset("assets/images/news_logo.png")),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  width: 30,
                  height: 30,
                  child: Image.asset("assets/images/bitcoin_logo.png")),
              label: 'Crypto',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
