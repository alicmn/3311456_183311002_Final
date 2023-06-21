// ignore_for_file: prefer_final_fields, prefer_const_constructors, use_key_in_widget_constructors

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_app/pages/home_page.dart';
import 'package:sneakers_app/path/provider.dart';
import 'package:sneakers_app/utils/constants.dart';
import 'package:sneakers_app/view/bag/bag_screen.dart';
import 'package:sneakers_app/view/home/home_screen.dart';
import 'package:sneakers_app/view/profile/profile_screen.dart';
import 'package:sneakers_app/wallet/widgets/bottomnavigationbar.dart';
import 'package:sneakers_app/wallet/widgets/pages/statistics.dart';
import 'package:sneakers_app/weather/presentation/pages/location.dart';
import 'package:sneakers_app/weather/presentation/pages/weather_app.dart';

import '../weather/application/services/weather_model.dart';

class MainNavigator extends StatefulWidget {
  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  PageController _pageController = PageController();

  int _selectedIndex = 0;
  var _screen = [
    HomeScreen(),
    MyBagScreen(),
    Profile(),
    HomePage(),
    Bottom(),
    Statistics(),
    Weather(),
    Prov(),
  ];

  getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    return Locations(locationWeather: weatherData);
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 27.0,
        bubbleCurve: Curves.linear,
        selectedColor: AppConstantsColor.materialButtonColor,
        strokeColor: AppConstantsColor.materialButtonColor,
        unSelectedColor: Color(0xffacacac),
        backgroundColor: Colors.white,
        scaleFactor: 0.1,
        items: [
          CustomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
          ),
          CustomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
          ),
          CustomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
          ),
          CustomNavigationBarItem(
            icon: Icon(
              Icons.chat_outlined,
            ),
          ),
          CustomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet_outlined,
            ),
          ),
          CustomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart_outlined,
            ),
          ),
          CustomNavigationBarItem(
            icon: Icon(
              Icons.beach_access,
            ),
          ),
          CustomNavigationBarItem(
            icon: Icon(
              Icons.file_download,
            ),
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
