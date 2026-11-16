import 'package:get_it/get_it.dart';

// Navigation
import 'features/navigation/cubit/navigation_cubit.dart';

// Home
import 'features/home/data/datasources/home_local_data_source.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecases/get_home_data_usecase.dart';
import 'features/home/presentation/bloc/home_cubit.dart';

// Journal
import 'features/journal/data/datasources/journal_local_data_source.dart';
import 'features/journal/data/repositories/journal_repository_impl.dart';
import 'features/journal/domain/repositories/journal_repository.dart';
import 'features/journal/domain/usecases/add_journal_entry_usecase.dart';
import 'features/journal/domain/usecases/get_journal_entries_usecase.dart';
import 'features/journal/presentation/bloc/journal_cubit.dart';

// Insights
import 'features/insights/data/datasources/insights_local_data_source.dart';
import 'features/insights/data/repositories/insights_repository_impl.dart';
import 'features/insights/domain/repositories/insights_repository.dart';
import 'features/insights/domain/usecases/get_insights_data_usecase.dart';
import 'features/insights/presentation/bloc/insights_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Navigation
  sl.registerFactory(() => NavigationCubit());

  // ----------------- HOME FEATURE -----------------
  // Presentation: Cubit
  sl.registerFactory(() => HomeCubit(getHomeDataUseCase: sl()));

  // Domain: UseCase
  sl.registerLazySingleton(() => GetHomeDataUseCase(sl()));

  // Domain & Data: Repository
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(localDataSource: sl()),
  );

  // Data: DataSource
  sl.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(),
  );

  // ----------------- JOURNAL FEATURE -----------------
  // Presentation: Cubit
  sl.registerFactory(
    () => JournalCubit(getEntriesUseCase: sl(), addEntryUseCase: sl()),
  );

  // Domain: UseCases
  sl.registerLazySingleton(() => GetJournalEntriesUseCase(sl()));
  sl.registerLazySingleton(() => AddJournalEntryUseCase(sl()));

  // Domain & Data: Repository
  sl.registerLazySingleton<JournalRepository>(
    () => JournalRepositoryImpl(localDataSource: sl()),
  );

  // Data: DataSource
  sl.registerLazySingleton<JournalLocalDataSource>(
    () => JournalLocalDataSourceImpl(),
  );

  // ----------------- INSIGHTS FEATURE -----------------
  // Presentation: Cubit
  sl.registerFactory(() => InsightsCubit(getInsightsDataUseCase: sl()));

  // Domain: UseCase
  sl.registerLazySingleton(() => GetInsightsDataUseCase(sl()));

  // Domain & Data: Repository
  sl.registerLazySingleton<InsightsRepository>(
    () => InsightsRepositoryImpl(localDataSource: sl()),
  );

  // Data: DataSource
  sl.registerLazySingleton<InsightsLocalDataSource>(
    () => InsightsLocalDataSourceImpl(),
  );
}
