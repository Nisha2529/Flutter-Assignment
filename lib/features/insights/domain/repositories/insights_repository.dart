import '../entities/insights_data.dart';

abstract class InsightsRepository {
  Future<InsightsData> getInsightsData(String period);
}
