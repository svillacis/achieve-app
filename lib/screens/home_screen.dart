import 'package:achieve/screens/random_screen.dart';
import 'package:achieve/screens/book_screen.dart';
import 'package:achieve/screens/goal_screen.dart';
import 'package:flutter/material.dart';
import 'package:achieve/screens/daily_quote.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:achieve/screens/cat_screen.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:achieve/components/ad_manager.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _initAdMob() {
    // TODO: Initialize AdMob SDK
    return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  }

  BannerAd _bannerAd;

  void _loadBannerAd() {
    _bannerAd
      ..load()
      ..show(anchorType: AnchorType.top);
  }

  int _selectedIndex = 2;
  Color navBarColor = Color(0xff263859);

  List<Widget> _widgetOptions = <Widget>[
    RandomScreen(),
    CategoryScreen(),
    DailyQuote(),
    BookScreen(),
    GoalScreen(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_initAdMob();
    _bannerAd = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.smartBanner,
    );
    _loadBannerAd();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff17223b),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xffff6768),
        iconSize: 25,
        type: BottomNavigationBarType.fixed,
        elevation: 12,
        backgroundColor: Color(0xff263859),
        unselectedItemColor: Color(0xff6b778d),
        //
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.dice),
            label: 'Random',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote),
            label: 'Quotes',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.calendarCheck),
            label: 'Daily Quote',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bookOpen),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bullseye),
            label: 'Goals',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
