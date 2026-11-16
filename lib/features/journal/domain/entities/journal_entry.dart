import 'package:equatable/equatable.dart';

class JournalEntry extends Equatable {
  final String id;
  final int day;
  final String month;
  final String weekday;
  final String title;
  final String content;
  final String time;

  const JournalEntry({
    required this.id,
    required this.day,
    required this.month,
    required this.weekday,
    required this.title,
    required this.content,
    this.time = '06:30 PM',
  });

  @override
  List<Object?> get props => [id, day, month, weekday, title, content, time];
}
