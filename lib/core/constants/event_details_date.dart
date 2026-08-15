import 'package:evently_app/app/text_style.dart';
import 'package:evently_app/app/theme/app_colors_light.dart';
import 'package:flutter/cupertino.dart';

class EventDetailsDate extends StatelessWidget {

  DateTime date;
  EventDetailsDate({required this.date});

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
        child: Text("${date.day} ${date.month}",style: AppTextStyles.eventCardDate,),
      ),
    );
  }
}
