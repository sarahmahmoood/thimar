import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:semar/views/home_nav/pages/favourites.dart';
import 'package:semar/views/home_nav/pages/home.dart';
import 'package:semar/views/home_nav/pages/my_account.dart';
import 'package:semar/views/home_nav/pages/my_orders.dart';
import 'package:semar/views/home_nav/pages/notification%20.dart';

class HomeNavView extends StatefulWidget {
  const HomeNavView({super.key});

  @override
  State<HomeNavView> createState() => _HomeNavViewState();
}

class _HomeNavViewState extends State<HomeNavView> {
  int currentpage = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  final pages = [
    HomePageView(),
    MyOrdersPage(),
    NotificationPageView(),
    FavouritesPageView(),
    MyAccountPageView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentpage],
     /* bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentpage,
        onTap: (value) {
          print(value);
          currentpage = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "الرئيسية",backgroundColor: Colors.green),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/cart.svg"), label: ""),
        ],
      ),*/
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: currentpage,
        onTap: (value) {
          print(value);
          currentpage = value;
          setState(() {});
        },
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'الرئيسية',
            backgroundColor: Color(0xff4C8613),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/orders.svg"),
            label: 'طلباتي',
            backgroundColor: Color(0xff4C8613),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/Notification.svg"),
            label: 'الإشعارات',
            backgroundColor: Color(0xff4C8613),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/favourites.svg"),
            label: 'المفضلة',
            backgroundColor: Color(0xff4C8613),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/profile.svg"),
            label: 'حسابي',
            backgroundColor: Color(0xff4C8613),
          ),
        ],
      ),

    );
  }
}
