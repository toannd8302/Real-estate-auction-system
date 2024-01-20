import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_estate_auction_system/core/constants/demension_constatnt.dart';
import 'package:real_estate_auction_system/pages/home_screen.dart';
import 'package:real_estate_auction_system/pages/profile_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static String routeName = "/main";
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late List<Widget> _screens;
  late GlobalKey<NavigatorState> _homeNavigatorKey;
  late GlobalKey<NavigatorState> _profileNavigatorKey;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeNavigatorKey = GlobalKey<NavigatorState>();
    _profileNavigatorKey = GlobalKey<NavigatorState>();

    _screens = [
      Navigator(
        key: _homeNavigatorKey,
        initialRoute: HomeSreen.routeName,
        onGenerateRoute: (setting) {
          switch (setting.name) {
            case HomeSreen.routeName:
              return MaterialPageRoute(
                builder: (context) => const HomeSreen(),
              );
          }
        },
      ),
      Container(
        color: Colors.green,
      ),
      Container(
        color: Colors.blue,
      ),
      Navigator(
        key: _profileNavigatorKey,
        initialRoute: ProfileScreen.routeName,
        onGenerateRoute: (setting) {
          switch (setting.name) {
            case ProfileScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              );
          }
        },
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Khai báo kích thước màn hình cho flutter_screenutil

      backgroundColor: Colors.white,
      //ToDo: Dùng IndexedStack để giữ trạng thái của các tab khi chuyển qua lại
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      //Todo: Tạo ra bottom navigation bar tương tác phía dưới màn hình
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex =
                  index; //ToDo: Cập nhật lại giá trị của _currentIndex
            });
          },
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).primaryColor.withOpacity(0.2),
          margin: const EdgeInsets.symmetric(
              horizontal: kMediumPadding, vertical: kDefaultPadding),
          items: [
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.house,
                  size: kDefaultIconSize,
                ),
                title: const Text('Home')),
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.gavel,
                  size: kDefaultIconSize,
                ),
                title: const Text('Likes')),
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.briefcase,
                  size: kDefaultIconSize,
                ),
                title: const Text('Booking')),
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.solidUser,
                  size: kDefaultIconSize,
                ),
                title: const Text('Profile')),
          ]),
    );
  }
}
