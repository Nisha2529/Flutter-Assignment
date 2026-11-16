import '../entities/insights_data.dart';
import '../repositories/insights_repository.dart';

class GetInsightsDataUseCase {
  final InsightsRepository repository;

  GetInsightsDataUseCase(this.repository);

  Future<InsightsData> call(String period) async {
    return await repository.getInsightsData(period);
  }
}
