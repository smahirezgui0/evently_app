import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors_light.dart';
import '../../add_event_screen.dart';

class FloatingActBtn extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      shape: CircleBorder(),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddEventScreen()),
        );
      },
      backgroundColor: AppColorsLight.mainColor,
      child: Icon(Icons.add, color: Colors.white, size: 24),
    );
  }

}