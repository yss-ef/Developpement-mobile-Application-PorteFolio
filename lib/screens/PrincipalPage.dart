import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
  // Variable de navigation
  int _page = 0;
  // Liste de pages a afficher
  List<Widget> screens = [HomePage(), ContactPage(), InfoPage(), ProjectPage()];

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // --- Widget bar de navigation navigation ---
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.info, size: 30),
          Icon(Icons.local_library_rounded, size: 30),
          Icon(Icons.picture_as_pdf, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.yellow,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
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
