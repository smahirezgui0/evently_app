import 'package:evently_app/app/theme/app_colors_dark.dart';
import 'package:flutter/cupertino.dart';

import '../../app/theme/app_colors_light.dart';
import 'event_details_date.dart';
import 'event_title_card.dart';

class EventCardAdd extends StatelessWidget {

  String imgLink;

  EventCardAdd({required this.imgLink});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: BoxBorder.all(color: AppColorsLight.stroke, width: 1),
          image: DecorationImage(
            image: AssetImage(imgLink),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        height: 193,
        width: double.maxFinite,
      ),
    );
  }
}
