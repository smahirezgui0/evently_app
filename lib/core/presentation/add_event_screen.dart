import 'package:evently_app/app/theme/app_colors_light.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../app/text_style.dart';
import '../constants/add_event_type_lsv.dart';
import '../constants/event_card_add.dart';

class AddEventScreen extends StatefulWidget {
  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  String get selectedCategory => eventTypes[selectedIndexCate]["title"];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final supabase = Supabase.instance.client;
  int selectedIndexCate = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  Future<void> addEvent() async {
    try {
      if (titleController.text.trim().isEmpty) {
        return;
      }

      if (selectedDate == null || selectedTime == null) {
        return;
      }

      final supabase = Supabase.instance.client;

      final date =
          "${selectedDate!.year}-"
          "${selectedDate!.month.toString().padLeft(2, '0')}-"
          "${selectedDate!.day.toString().padLeft(2, '0')}";

      final time =
          "${selectedTime!.hour.toString().padLeft(2, '0')}:"
          "${selectedTime!.minute.toString().padLeft(2, '0')}:00";

      await supabase.from('events').insert({
        'category': eventTypes[selectedIndexCate]["title"],
        'title': titleController.text.trim(),
        'description': descriptionController.text.trim(),
        'event_date': date,
        'event_time': time,
      });

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Event added successfully"),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
        ),
      );
    }
  }

  final List<Map<String, dynamic>> eventTypes = [
    {
      "icon": Icons.book_rounded,
      "title": "Book club",
      "image": "assets/BookClub.png",
    },
    {
      "icon": Icons.motorcycle_outlined,
      "title": "Sport",
      "image": "assets/Sport.png",
    },
    {"icon": Icons.cake, "title": "Birthday", "image": "assets/Birthday.png"},
    {
      "icon": Icons.groups_outlined,
      "title": "Meeting",
      "image": "assets/Meeting.png",
    },
  ];

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          color: AppColorsLight.mainColor,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_sharp),
                        ),
                      ),
                    ),
                    Text("Add Event", style: AppTextStyles.addEventText),
                  ],
                ),
              ),
            ),
            EventCardAdd(imgLink: eventTypes[selectedIndexCate]["image"]),
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: eventTypes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndexCate = index;
                      });
                    },
                    child: AddEventTypeLsv(
                      iconT: eventTypes[index]["icon"],
                      typeTit: eventTypes[index]["title"],
                      selected: selectedIndexCate == index,
                    ),
                  );
                },
              ),
            ),
            Text(
              textAlign: TextAlign.left,
              "Title",
              style: AppTextStyles.eventCardTitle,
            ),

            const SizedBox(height: 16),

            // =========================
            // Event Title TextField
            // =========================
            Container(
              height: 48,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColorsLight.stroke, width: 2),
              ),

              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: TextField(
                  controller: titleController,
                  style: AppTextStyles.mainTextSt,
                  decoration: InputDecoration(
                    hintText: "Event Title",
                    hintStyle: AppTextStyles.hintStyle,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              textAlign: TextAlign.left,
              "Description",
              style: AppTextStyles.eventCardTitle,
            ),

            const SizedBox(height: 16),

            // =========================
            // Description TextField
            // =========================
            Container(
              height: 168,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),

                border: Border.all(color: AppColorsLight.stroke, width: 2),
              ),

              child: TextField(
                controller: descriptionController,

                maxLines: null,
                expands: true,

                textAlignVertical: TextAlignVertical.top,

                style: AppTextStyles.mainTextSt,

                decoration: InputDecoration(
                  hintText: "Event Description....",

                  hintStyle: AppTextStyles.hintStyle,

                  border: InputBorder.none,

                  contentPadding: EdgeInsets.all(38),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // =========================
            // Event Date
            // =========================
            Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  size: 24,
                  color: AppColorsLight.mainColor,
                ),

                const SizedBox(width: 20),

                Text("Event Date", style: AppTextStyles.mainTextSt),

                const Spacer(),

                GestureDetector(
                  onTap: () async {
                    DateTime? date = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      initialDate: DateTime.now(),
                    );

                    if (date != null) {
                      setState(() {
                        selectedDate = date;
                      });
                    }
                  },

                  child: Text(
                    selectedDate == null
                        ? "Choose date"
                        : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // =========================
            // Event Time
            // =========================
            Row(
              children: [
                Icon(
                  Icons.access_time_outlined,
                  size: 24,
                  color: AppColorsLight.mainColor,
                ),

                const SizedBox(width: 20),

                Text("Event Time", style: AppTextStyles.mainTextSt),

                const Spacer(),

                GestureDetector(
                  onTap: () async {
                    TimeOfDay? time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (time != null) {
                      setState(() {
                        selectedTime = time;
                      });
                    }
                  },

                  child: Text(
                    selectedTime == null
                        ? "Choose time"
                        : selectedTime!.format(context),
                  ),
                ),
              ],
            ),

            // =========================
            // Add Event Button
            // =========================
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 48,

                child: ElevatedButton(
                  onPressed: () {
                    addEvent();
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColorsLight.mainColor,

                    foregroundColor: Colors.white,

                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),

                  child: Text("Add event", style: AppTextStyles.btnText),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
