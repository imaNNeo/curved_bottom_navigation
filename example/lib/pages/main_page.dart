import 'dart:math' as math;

import 'package:curved_bottom_navigation/curved_bottom_navigation.dart';
import 'package:flutter/material.dart';

import './search_page.dart';
import './favorites_page.dart';
import './notifications_page.dart';
import './home_page.dart';
import './settings_page.dart';

class MainPage extends StatefulWidget {
  static final navHeight = 68.0;
  static final fabSize = 62.0;
  static final fabMargin = 8.0;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int navPos = 0;

  @override
  Widget build(BuildContext context) {
    final double additionalBottomPadding = math.max(MediaQuery.of(context).padding.bottom, 0.0);

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: additionalBottomPadding +
                  MainPage.navHeight -
                  (MainPage.fabSize / 2) -
                  MainPage.fabMargin,
            ),
            child: IndexedStack(
              index: navPos,
              children: [
                SearchPage(),
                FavoritesPage(),
                HomePage(),
                NotificationsPage(),
                SettingsPage(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CurvedBottomNavigation(
              navHeight: MainPage.navHeight,
              fabSize: MainPage.fabSize,
              fabMargin: MainPage.fabMargin,
              selected: navPos,
              onItemClick: (i) {
                setState(() {
                  navPos = i;
                });
              },
              items: [
                Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
