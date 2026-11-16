import '../models/journal_entry_model.dart';

abstract class JournalLocalDataSource {
  Future<List<JournalEntryModel>> getEntries(String selectedMonth);
  Future<void> addEntry(JournalEntryModel entry);
}

class JournalLocalDataSourceImpl implements JournalLocalDataSource {
  final List<JournalEntryModel> _mockEntries = [
    // Oct entries (matches default initial selection in Figma and test)
    const JournalEntryModel(
      id: '1',
      day: 12,
      month: 'Oct',
      weekday: 'Mon',
      title: 'A Day To Remember',
      content: 'Today felt like a good day to slow down. I finally made time for something I had been putting off for weeks...',
      time: '06:30 PM',
    ),
    const JournalEntryModel(
      id: '2',
      day: 10,
      month: 'Oct',
      weekday: 'Sat',
      title: 'A Thought To Keep',
      content: "I'm learning to feel my own pace and enjoy the process instead of worrying about the final outcome.",
      time: '02:15 PM',
    ),
    const JournalEntryModel(
      id: '3',
      day: 9,
      month: 'Oct',
      weekday: 'Fri',
      title: 'Something I Realized',
      content: 'Small steps can still move me closer to where I want to be. Consistency always beats sporadic intensity.',
      time: '09:45 AM',
    ),
    // Aug entries
    const JournalEntryModel(
      id: '4',
      day: 28,
      month: 'Aug',
      weekday: 'Wed',
      title: 'Stargazing Reflections',
      content: 'Clear skies tonight brought a wonderful sense of clarity and renewed purpose.',
      time: '10:00 PM',
    ),
    const JournalEntryModel(
      id: '5',
      day: 15,
      month: 'Aug',
      weekday: 'Thu',
      title: 'Late Summer Solitude',
      content:
          'Taking time to sit by the water and reflect on the passing weeks.',
      time: '05:30 PM',
    ),
    // Sep entries
    const JournalEntryModel(
      id: '6',
      day: 22,
      month: 'Sep',
      weekday: 'Sun',
      title: 'Autumn Equinox Thoughts',
      content: 'Embracing balance as the season turns. Finding harmony between work and rest.',
      time: '04:20 PM',
    ),
    // Nov entries
    const JournalEntryModel(
      id: '7',
      day: 5,
      month: 'Nov',
      weekday: 'Tue',
      title: 'Gratitude & Focus',
      content: 'Grateful for steady progress. Keeping attention on what truly matters.',
      time: '08:30 AM',
    ),
  ];

  @override
  Future<List<JournalEntryModel>> getEntries(String selectedMonth) async {
    final filtered = _mockEntries
        .where(
          (entry) => entry.month.toLowerCase() == selectedMonth.toLowerCase(),
        )
        .toList();
    return List.unmodifiable(filtered);
  }

  @override
  Future<void> addEntry(JournalEntryModel entry) async {
    _mockEntries.insert(0, entry);
  }
}
