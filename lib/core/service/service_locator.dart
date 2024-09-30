
import 'package:digiflay_task/core/database/bloc/global_cubit.dart';
import 'package:digiflay_task/features/auth/data/repository/auth_repository.dart';
import 'package:digiflay_task/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../database/api/api_consumer.dart';
import '../database/api/dio_consumer.dart';
import '../database/cache/cache_helper.dart';

final sl = GetIt.instance;


void initServiceLocator(){

  // cubits
  sl.registerFactory(()=>GlobalCubit());
  sl.registerFactory(()=>AuthCubit(sl()));


  //auth feature
  sl.registerLazySingleton(() => AuthRepository());


  // external
  sl.registerLazySingleton(()=>CacheHelper());

  // Api
  sl.registerLazySingleton<ApiConsumer>(()=>DioConsumer(sl()));
  sl.registerLazySingleton(()=>Dio());



}