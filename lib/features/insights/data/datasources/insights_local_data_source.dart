import '../models/insights_data_model.dart';

abstract class InsightsLocalDataSource {
  Future<InsightsDataModel> getInsightsData(String period);
}

class InsightsLocalDataSourceImpl implements InsightsLocalDataSource {
  @override
  Future<InsightsDataModel> getInsightsData(String period) async {
    return InsightsDataModel.mock(period);
  }
}
