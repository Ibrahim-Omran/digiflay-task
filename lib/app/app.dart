import 'package:device_preview/device_preview.dart';
import 'package:digiflay_task/core/database/api/end_points.dart';
import 'package:digiflay_task/core/database/cache/cache_helper.dart';
import 'package:digiflay_task/core/service/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/database/bloc/global_cubit.dart';
import '../core/locale/app_locale.dart';
import '../core/routes/app_routes.dart';
import '../core/theme/app_theme.dart';
import '../core/utils/app_strings.dart';

class DigiFlayApp extends StatelessWidget {
  final AppRoutes appRouter;

  const DigiFlayApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, state) {
        return BlocBuilder<GlobalCubit, GlobalState>(
          builder: (context, state) {
            return MaterialApp(
              useInheritedMediaQuery: true,
              //locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                AppLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('ar', "EG"),
                Locale('en', "US"),
              ],
              locale: Locale(BlocProvider
                  .of<GlobalCubit>(context)
                  .langCode),
              //locale: Locale('en'),
              title: AppStrings.digiFlayApp,
              theme: getAppTheme(),
              initialRoute:
              sl<CacheHelper>().getData(key: ApiKeys.accessToken) == null
                  ? Routes.intitlRoute
                  : Routes.home,
              onGenerateRoute: appRouter.generateRouter,
            );
          },
        );
      },
    );
  }
}
