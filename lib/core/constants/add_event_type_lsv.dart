import 'package:evently_app/app/text_style.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors_light.dart';

class AddEventTypeLsv extends StatelessWidget {
  final bool selected;
  final IconData iconT;
  final String typeTit;

  const AddEventTypeLsv({
    super.key,
    required this.selected,
    required this.iconT,
    required this.typeTit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: selected
              ? AppColorsLight.mainColor
              : Colors.white,
          border: Border.all(
            color: AppColorsLight.stroke,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                iconT,
                color: selected
                    ? Colors.white
                    : AppColorsLight.mainColor,
              ),

              const SizedBox(width: 8),

              Text(
                typeTit,
                style: selected
                    ? AppTextStyles.eventCardTitleSelected
                    : AppTextStyles.eventCardTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}