import '../models/home_data_model.dart';

abstract class HomeLocalDataSource {
  Future<HomeDataModel> getHomeData();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<HomeDataModel> getHomeData() async {
    return HomeDataModel.mock();
  }
}
