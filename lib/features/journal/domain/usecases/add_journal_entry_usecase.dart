import '../entities/journal_entry.dart';
import '../repositories/journal_repository.dart';

class AddJournalEntryUseCase {
  final JournalRepository repository;

  AddJournalEntryUseCase(this.repository);

  Future<void> call(JournalEntry entry) async {
    await repository.addEntry(entry);
  }
}
