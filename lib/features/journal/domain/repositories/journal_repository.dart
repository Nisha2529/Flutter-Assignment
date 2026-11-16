import '../entities/journal_entry.dart';

abstract class JournalRepository {
  Future<List<JournalEntry>> getEntries(String selectedMonth);
  Future<void> addEntry(JournalEntry entry);
}
