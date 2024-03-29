import 'package:bookly_with_clean_arch/Features/search/data/data_sources/search_remote_data_source.dart';
import 'package:bookly_with_clean_arch/Features/search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../Features/home/data/data_sourses/local_data/home_local_data_source_impl.dart';
import '../../../Features/home/data/data_sourses/remote_data/home_remote_data_source_impl.dart';
import '../../../Features/home/data/repos/home_repo_impl.dart';
import '../api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );

  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      SearchRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
}
