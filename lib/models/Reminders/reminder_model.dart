class ReminderModel {
  final int id;
  final String text;
  final DateTime dateTime;

  ReminderModel({required this.id, required this.text, required this.dateTime});

  ReminderModel copyWith({int? id, String? text, DateTime? dateTime}){
    return ReminderModel(
      id: id ?? this.id,
      text: text ?? this.text,
      dateTime: dateTime ?? this.dateTime, 
    );
  }
}
