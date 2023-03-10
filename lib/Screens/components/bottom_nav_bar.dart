import 'package:flutter/material.dart';
import '/constants.dart';
import 'package:icons_plus/icons_plus.dart';

class CustomBottomBarNav extends StatefulWidget {
  const CustomBottomBarNav({
    super.key,
  });

  @override
  State<CustomBottomBarNav> createState() => _CustomBottomBarNavState();
}

class _CustomBottomBarNavState extends State<CustomBottomBarNav> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) => setState(() {
        index = value;
      }),
      currentIndex: index,
      showSelectedLabels: false,
      backgroundColor: dashgr3,
      showUnselectedLabels: false,
      selectedLabelStyle: TextStyle(color: c4),
      unselectedLabelStyle: TextStyle(color: dashCardsubHead),
      iconSize: 32,
      useLegacyColorScheme: true,
      items: [
        BottomNavigationBarItem(
          activeIcon: Icon(
            Bootstrap.house_heart_fill,
            color: c4,
          ),
          icon: Icon(
            Bootstrap.house_heart,
            color: c4,
          ),
          label: "Home",
          tooltip: "Home",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Bootstrap.book_fill,
            color: c4,
          ),
          icon: Icon(
            Bootstrap.book,
            color: c4,
          ),
          label: "Home",
          tooltip: "Home",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Bootstrap.three_dots,
            color: c4,
          ),
          icon: Icon(
            Bootstrap.three_dots_vertical,
            color: c4,
          ),
          label: "Home",
          tooltip: "Home",
        )
      ],
    );
  }
}
