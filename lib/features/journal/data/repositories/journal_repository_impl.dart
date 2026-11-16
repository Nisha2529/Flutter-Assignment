import '../../domain/entities/journal_entry.dart';
import '../../domain/repositories/journal_repository.dart';
import '../datasources/journal_local_data_source.dart';
import '../models/journal_entry_model.dart';

class JournalRepositoryImpl implements JournalRepository {
  final JournalLocalDataSource localDataSource;

  JournalRepositoryImpl({required this.localDataSource});

  @override
  Future<List<JournalEntry>> getEntries(String selectedMonth) async {
    return await localDataSource.getEntries(selectedMonth);
  }

  @override
  Future<void> addEntry(JournalEntry entry) async {
    final model = JournalEntryModel(
      id: entry.id,
      day: entry.day,
      month: entry.month,
      weekday: entry.weekday,
      title: entry.title,
      content: entry.content,
      time: entry.time,
    );
    await localDataSource.addEntry(model);
  }
}
