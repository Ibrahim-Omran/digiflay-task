import 'package:device_preview/device_preview.dart';
import 'package:digiflay_task/app/app.dart';
import 'package:digiflay_task/core/routes/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/database/bloc/bloc_observer.dart';
import 'core/database/bloc/global_cubit.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/service/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  initServiceLocator();
  await sl<CacheHelper>().init();

  runApp(
      BlocProvider(
        create: (context) =>sl<GlobalCubit>()..getCachedLang(),
       child:  DevicePreview(
         enabled: !kReleaseMode,
         builder: (context) => DigiFlayApp(appRouter: AppRoutes()), // Wrap your app
       ),
       // child: DigiFlayApp(appRouter: AppRoutes()),
      ));
}


