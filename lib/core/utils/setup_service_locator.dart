import 'package:get_it/get_it.dart';

import '../../Features/home/data/data_source/home_local_data_source.dart';
import '../../Features/home/data/data_source/home_reomte_data_source.dart';
import '../../Features/home/data/repo/home_repo_impl.dart';
import '../helper/api_service.dart';

final GetIt getIt = GetIt.instance;

void serviceLocator(){
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<HomeRepoImpl>(  HomeRepoImpl(
      homeRemoteDataSource:
      HomeRemoteDataSourceImpl(apiService: getIt.get<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImpl()));
}