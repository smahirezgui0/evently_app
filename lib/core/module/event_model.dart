class EventModel {
  final String id;
  final String category;
  final String title;
  final String description;
  final DateTime eventDate;
  final String eventTime;

  EventModel({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.eventDate,
    required this.eventTime,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      category: json['category'],
      title: json['title'],
      description: json['description'] ?? '',
      eventDate: DateTime.parse(json['event_date']),
      eventTime: json['event_time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'title': title,
      'description': description,
      'event_date': eventDate.toIso8601String(),
      'event_time': eventTime,
    };
  }

}