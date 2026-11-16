import '../../domain/entities/insights_data.dart';
import '../../domain/repositories/insights_repository.dart';
import '../datasources/insights_local_data_source.dart';

class InsightsRepositoryImpl implements InsightsRepository {
  final InsightsLocalDataSource localDataSource;

  InsightsRepositoryImpl({required this.localDataSource});

  @override
  Future<InsightsData> getInsightsData(String period) async {
    return await localDataSource.getInsightsData(period);
  }
}
