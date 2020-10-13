import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'main_page.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: MainPage.navHeight - (MainPage.fabSize / 2),
              top: math.max(MediaQuery.of(context).padding.top, 0.0),
            ),
            child: Stack(
              children: [
                Placeholder(
                  color: Colors.white.withOpacity(0.25),
                ),
                Center(
                  child: Text(
                    "Search",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
