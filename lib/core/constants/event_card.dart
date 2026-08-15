import 'package:evently_app/app/theme/app_colors_dark.dart';
import 'package:flutter/cupertino.dart';

import '../../app/theme/app_colors_light.dart';
import 'event_details_date.dart';
import 'event_title_card.dart';

class EventCard extends StatelessWidget {
  DateTime date;
  String title;
  EventCard({required this.title,required this.date});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: BoxBorder.all(color: AppColorsLight.stroke, width: 1),
          image: DecorationImage(
            image: AssetImage("assets/Birthday.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        height: 193,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [EventDetailsDate(date: date,), EventTitleCard(title: title,)],
          ),
        ),
      ),
    );
  }
}
