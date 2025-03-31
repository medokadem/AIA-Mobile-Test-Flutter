import 'package:aia_mobile_test_flutter/catalog/service/chatgpt/chat_gpt_service.dart';
import 'package:aia_mobile_test_flutter/catalog/view/gpt/bloc/chat_gpt_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../catalog/infrastructure/data_source/feature/feature_remote_data_source.dart';
import '../catalog/infrastructure/repository/feature/feature_repository.dart';
import '../catalog/service/navigation/navigation_service.dart';
import '../catalog/service/network/dio_network_service.dart';
import '../catalog/view/feature/bloc/get_feature_bloc.dart';

final getIt = GetIt.instance;

Future init() async {

  ///Services Layer
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerSingleton<DioNetworkService>(DioNetworkService());
  getIt.registerLazySingleton<Dio>(() => getIt<DioNetworkService>().dio);
  getIt.registerSingleton<ChatGPTService>(ChatGPTService(getIt()));

  ///Data Layer data sources
  getIt.registerLazySingleton(() => FeatureRemoteDataSource(getIt()));

  ///Infrastructure Layer - repositories
  getIt.registerLazySingleton(() => FeatureRepository(featureRemoteDataSource: getIt()));

  ///Presentation Layer - Blocs
  getIt.registerFactory(() => GetFeatureBloc(featureRepository: getIt()));
  getIt.registerFactory(() => ChatGPTBloc(chatGPTService: getIt()));

}
