import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/journal_entry.dart';
import '../../domain/usecases/add_journal_entry_usecase.dart';
import '../../domain/usecases/get_journal_entries_usecase.dart';

abstract class JournalState extends Equatable {
  const JournalState();

  @override
  List<Object?> get props => [];
}

class JournalInitial extends JournalState {}

class JournalLoading extends JournalState {}

class JournalLoaded extends JournalState {
  final List<JournalEntry> entries;
  final String selectedMonth;

  const JournalLoaded({required this.entries, this.selectedMonth = 'Oct'});

  JournalLoaded copyWith({List<JournalEntry>? entries, String? selectedMonth}) {
    return JournalLoaded(
      entries: entries ?? this.entries,
      selectedMonth: selectedMonth ?? this.selectedMonth,
    );
  }

  @override
  List<Object?> get props => [entries, selectedMonth];
}

class JournalError extends JournalState {
  final String message;

  const JournalError(this.message);

  @override
  List<Object?> get props => [message];
}

class JournalCubit extends Cubit<JournalState> {
  final GetJournalEntriesUseCase getEntriesUseCase;
  final AddJournalEntryUseCase addEntryUseCase;

  JournalCubit({required this.getEntriesUseCase, required this.addEntryUseCase})
    : super(JournalInitial());

  Future<void> loadEntries({String month = 'Oct'}) async {
    if (state is JournalLoaded) return;
    emit(JournalLoading());
    try {
      final entries = await getEntriesUseCase(month);
      emit(JournalLoaded(entries: entries, selectedMonth: month));
    } catch (e) {
      emit(JournalError(e.toString()));
    }
  }

  Future<void> selectMonth(String month) async {
    try {
      final entries = await getEntriesUseCase(month);
      emit(JournalLoaded(entries: entries, selectedMonth: month));
    } catch (e) {
      emit(JournalError(e.toString()));
    }
  }

  Future<void> addNewEntry({
    required String title,
    required String content,
  }) async {
    final now = DateTime.now();
    final hour = now.hour % 12 == 0 ? 12 : now.hour % 12;
    final minute = now.minute.toString().padLeft(2, '0');
    final ampm = now.hour >= 12 ? 'PM' : 'AM';
    final timeStr = '${hour.toString().padLeft(2, '0')}:$minute $ampm';

    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final monthStr = months[now.month - 1];

    final newEntry = JournalEntry(
      id: now.millisecondsSinceEpoch.toString(),
      day: now.day,
      month: monthStr,
      weekday: 'Today',
      title: title,
      content: content,
      time: timeStr,
    );

    try {
      await addEntryUseCase(newEntry);
      if (state is JournalLoaded) {
        final current = state as JournalLoaded;
        if (current.selectedMonth.toLowerCase() == monthStr.toLowerCase()) {
          emit(current.copyWith(entries: [newEntry, ...current.entries]));
        } else {
          await selectMonth(monthStr);
        }
      } else {
        await loadEntries(month: monthStr);
      }
    } catch (e) {
      emit(JournalError(e.toString()));
    }
  }
}
