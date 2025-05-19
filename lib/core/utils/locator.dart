import 'package:dio/dio.dart';
import 'package:food_app/core/utils/api_service.dart';
import 'package:food_app/feature/home/data/repo/home_repo_impl.dart';
import 'package:food_app/feature/pop_up/data/repo/pop_up_impl.dart';
import 'package:food_app/feature/search/data/repo/search_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<PopUpRepoImpl>(
    PopUpRepoImpl(getIt.get<ApiService>()),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(getIt.get<ApiService>()),
  );
}
