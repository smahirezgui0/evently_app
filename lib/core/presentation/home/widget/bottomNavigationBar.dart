
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors_light.dart';

class Bottomnavigationbar extends StatefulWidget{
  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar> {
  int selectedItemNum = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(

      currentIndex: selectedItemNum,
      backgroundColor: AppColorsLight.inputs,
      selectedItemColor: AppColorsLight.mainColor,
      unselectedItemColor: AppColorsLight.disable,
      onTap: (value) {
        setState(() {
          selectedItemNum = value;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorite"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Persone"
        ),
      ],
    );
  }
}