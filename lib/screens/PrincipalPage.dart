import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../components/MyDrawer.dart';
import './HomePage.dart';
import './ContactPage.dart';
import './InfoPage.dart';
import './ProjectPage.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({super.key});

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  int _page = 0;

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> screens = [
    const HomePage(),
    const ContactPage(),
    const InfoPage(),
    const ProjectPage()
  ];

  void _onDrawerItemTapped(int index) {
    setState(() {
      _page = index;
      final state = _bottomNavigationKey.currentState;
      state?.setPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.blueAccent, size: 30),
      ),

      drawer: MyDrawer(onTapIndex: _onDrawerItemTapped),

      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.phone, size: 30),
          Icon(Icons.info, size: 30),
          Icon(Icons.hub, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: const Color(0xFFF5F5F5),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),

      body: screens[_page],
    );
  }
}