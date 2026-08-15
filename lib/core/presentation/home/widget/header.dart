import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/text_style.dart';
import '../../../../app/theme/app_colors_light.dart';

class Header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(height: 22),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Welcome Back", style: AppTextStyles.welcomeBackSt),
                Text("John Safwat", style: AppTextStyles.mainTextSt),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    size: 24,
                    Icons.light_mode_rounded,
                    color: AppColorsLight.mainColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Container(
                      height: 34,
                      width: 34,
                      color: AppColorsLight.mainColor,
                      child: Center(
                        child: Text(
                          "En",
                          style: TextStyle(color: AppColorsLight.inputs),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

}