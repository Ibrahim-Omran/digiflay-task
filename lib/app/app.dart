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
      builder: (context,state) {
        return MaterialApp(
              debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            AppLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar',"EG"),
            Locale('en',"US"),
          ],
         // locale: Locale(BlocProvider.of<GlobalCubit>(context).langCode),
          locale: Locale('en'),
              title: AppStrings.digiFlayApp,
              theme: getAppTheme(),
              initialRoute: Routes.intitlRoute,
              onGenerateRoute: appRouter.generateRouter,
            );
          },
        );
      }
  }

