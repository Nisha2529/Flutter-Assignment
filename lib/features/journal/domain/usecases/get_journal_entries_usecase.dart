import '../entities/journal_entry.dart';
import '../repositories/journal_repository.dart';

class GetJournalEntriesUseCase {
  final JournalRepository repository;

  GetJournalEntriesUseCase(this.repository);

  Future<List<JournalEntry>> call(String selectedMonth) async {
    return await repository.getEntries(selectedMonth);
  }
}
