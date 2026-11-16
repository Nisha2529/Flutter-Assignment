import '../../domain/entities/journal_entry.dart';

class JournalEntryModel extends JournalEntry {
  const JournalEntryModel({
    required super.id,
    required super.day,
    required super.month,
    required super.weekday,
    required super.title,
    required super.content,
    super.time = '06:30 PM',
  });

  static List<JournalEntryModel> defaultMockEntries() {
    return const [
      JournalEntryModel(
        id: '1',
        day: 12,
        month: 'Aug',
        weekday: 'Mon',
        title: 'A Day To Remember',
        content: 'Today felt like a good day to slow down. I finally made time for something I had been putting off for weeks...',
        time: '06:30 PM',
      ),
      JournalEntryModel(
        id: '2',
        day: 10,
        month: 'Aug',
        weekday: 'Sat',
        title: 'A Thought To Keep',
        content: "I'm learning to feel my own pace and enjoy the process instead of worrying about the final outcome.",
        time: '02:15 PM',
      ),
      JournalEntryModel(
        id: '3',
        day: 9,
        month: 'Aug',
        weekday: 'Fri',
        title: 'Something I Realized',
        content: 'Small steps can still move me closer to where I want to be. Consistency always beats sporadic intensity.',
        time: '09:45 AM',
      ),
    ];
  }
}
