import 'package:evently_app/app/text_style.dart';
import 'package:evently_app/app/theme/app_colors_light.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventTitleCard extends StatelessWidget {
  String title;
  EventTitleCard({required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColorsLight.background,
        border: BoxBorder.all(color: AppColorsLight.stroke, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text((title),style: AppTextStyles.eventCardTitle,),
            Icon(Icons.favorite_border,color: AppColorsLight.mainColor,)
          ],
        ),
      ),
    );
  }
}
