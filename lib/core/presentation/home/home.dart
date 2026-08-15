import 'package:evently_app/app/theme/app_colors_dark.dart';
import 'package:evently_app/app/theme/app_colors_light.dart';
import 'package:evently_app/core/presentation/home/widget/bottomNavigationBar.dart';
import 'package:evently_app/core/presentation/home/widget/floating_act_btn.dart';
import 'package:evently_app/core/presentation/home/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../app/text_style.dart';
import '../../constants/event_card.dart';
import '../../module/event_model.dart';
import '../add_event_screen.dart';
import '../event_details.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool themMode = true;

  // دالة جلب البيانات
  Future<List<EventModel>> getEvents() async {
    final supabase = Supabase.instance.client;

    final response = await supabase
        .from('events')
        .select()
        .order('event_date', ascending: true);

    return response
        .map<EventModel>(
          (json) => EventModel.fromJson(json),
    )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // استخدام FutureBuilder لجلب البيانات وعرضها
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActBtn(),
        backgroundColor: themMode
            ? AppColorsLight.background
            : AppColorsDark.background,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // todo : first section
              Header(),
              SizedBox(height: 22),
              // todo : event list
              Expanded(
                child: FutureBuilder<List<EventModel>>(
                  future: getEvents(), // استدعاء الدالة لجلب البيانات
                  builder: (context, snapshot) {
                    // التحقق من حالة التحميل
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: themMode ? Colors.blue : Colors.white,
                        ),
                      );
                    }

                    // التحقق من وجود خطأ
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'حدث خطأ: ${snapshot.error}',
                          style: TextStyle(
                            color: themMode ? Colors.black : Colors.white,
                          ),
                        ),
                      );
                    }

                    // التحقق من وجود بيانات
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          'لا توجد أحداث حالياً',
                          style: TextStyle(
                            color: themMode ? Colors.black : Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      );
                    }
                    List<EventModel> events = snapshot.data!;

                    return ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        EventModel event = events[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EventDetails(
                                events: event,
                              )),
                            );
                          },
                          child: EventCard(
                            title: event.title,
                            date: event.eventDate,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Bottomnavigationbar(),
      ),
    );
  }
}