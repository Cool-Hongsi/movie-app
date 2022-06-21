import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_search/theme/app_color.dart';
import 'package:movie_search/view/home/favorite_page.dart';
import 'package:movie_search/view/home/profile_page.dart';
import 'package:movie_search/view/home/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentBottomTabIndex = 0; // Default index of page (SearchPage)

  void _onSelectBottomTab(int index) async {
    setState(() {
      _currentBottomTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = <Widget>[
      const SearchPage(),
      const FavoritePage(),
      const ProfilePage()
    ];

    return Scaffold(
      // Fix height for top timezone section no matter what device size is
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: backgroundColorWhite,
          elevation: 0,
        )
      ),
      backgroundColor: backgroundColorWhite,
      body: pages.elementAt(_currentBottomTabIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Get.width * 0.1),
            topRight: Radius.circular(Get.width * 0.1)
          ),
          color: Colors.transparent,
          boxShadow: const [
            BoxShadow(color: Colors.black26, spreadRadius: -5, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Get.width * 0.1),
            topRight: Radius.circular(Get.width * 0.1)
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: backgroundColorWhite,
            selectedItemColor: navSelected,
            unselectedItemColor: navUnselected,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 24,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                  size: 24,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                  size: 24,
                ),
                label: "",
              ),
            ],
            currentIndex: _currentBottomTabIndex,
            onTap: _onSelectBottomTab,
          ),
        ),
      ),
    );
  }
}
