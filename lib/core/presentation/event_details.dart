import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app/text_style.dart';
import '../../app/theme/app_colors_light.dart';
import '../constants/event_card_add.dart';
import '../module/event_model.dart';
import 'edit_event.dart';

class EventDetails extends StatelessWidget {
  EventModel events;
  EventDetails({
    required this.events,
});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColorsLight.background,
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    color: AppColorsLight.mainColor,
                    onPressed: () {
                      Navigator.pop(context,true);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_sharp),
                  ),
                ),
                Text("Add Event", style: AppTextStyles.addEventText),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        color: AppColorsLight.mainColor,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditEvent(
                              event: events,
                            )),
                          );
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        color: AppColorsLight.mainColor,
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete_outline,
                          color: AppColorsLight.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            EventCardAdd(imgLink: "assets/Exhibition.png"),
            SizedBox(height: 12),
            Text(events.title, style: AppTextStyles.mainTextSt),
            SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                border: BoxBorder.all(color: AppColorsLight.stroke, width: 1),
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: BoxBorder.all(
                          color: AppColorsLight.stroke,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        color: AppColorsLight.background,
                      ),
                      height: 44,
                      width: 44,
                      child: Icon(
                        Icons.calendar_month,
                        size: 24,
                        color: AppColorsLight.mainColor,
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      children: [
                        Text("${events.eventTime}", style: AppTextStyles.eventCardTitle),
                        Text("${events.eventTime}",style: AppTextStyles.eventCardTitledisable,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            Text("Description", style: AppTextStyles.mainTextSt),
            SizedBox(height: 12),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                border: BoxBorder.all(color: AppColorsLight.stroke, width: 1),
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Padding(padding: EdgeInsets.all(12),
              child: Text(events.description,style: AppTextStyles.dateText,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
