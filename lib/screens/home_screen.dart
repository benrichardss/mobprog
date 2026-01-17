import 'package:bautista_mobprog/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../screens/newsfeed_screen.dart';
import '../screens/notification_screen.dart';
import '../widgets/custom_font.dart';

class HomeScreen extends StatefulWidget {
  final String? username;
  const HomeScreen({super.key, this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FB_DARK_PRIMARY,
      appBar: AppBar(
        backgroundColor: FB_DARK_PRIMARY,
        shadowColor: FB_TEXT_COLOR_WHITE,
        elevation: 2,
        title: CustomFont(
          text: _getAppBarTitle(_selectedIndex),
          fontSize: ScreenUtil().setSp(25),
          color: _getAppBarTitleColor(_selectedIndex),
          fontFamily: 'Klavika',
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          const NewsFeedScreen(),
          const NotificationScreen(),
          ProfileScreen(username: widget.username),
        ],
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onTappedBar,
        backgroundColor: FB_LIGHT_PRIMARY,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: FB_PRIMARY,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }

  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'doomscroll';
      case 1:
        return 'Notifications';
      case 2:
        return widget.username ?? 'Profile';
      default:
        return '';
    }
  }

  Color _getAppBarTitleColor(int index) {
    switch (index) {
      case 0:
        return FB_PRIMARY;
      case 1:
        return FB_TEXT_COLOR_WHITE;
      case 2:
        return FB_TEXT_COLOR_WHITE;
      default:
        return FB_TEXT_COLOR_WHITE;
    }
  }
}
