import 'package:digiflay_task/core/service/service_locator.dart';
import 'package:digiflay_task/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:digiflay_task/features/auth/presentation/screens/login_screen.dart';
import 'package:digiflay_task/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_routes.dart';


class Routes {
  static const String intitlRoute = '/';
  static const String signUp = '/signUp';


}

class AppRoutes {
  Route generateRouter(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments;
    switch (routeSettings.name) {

      case Routes.intitlRoute:
        return BaseRoute(
            page: BlocProvider(
              create: (context) => sl<AuthCubit>(),
              child: const LoginScreen(),
            ));

      case Routes.signUp:
        return BaseRoute(
            page: BlocProvider(
              create: (context) => sl<AuthCubit>(),
              child: const SignUpScreen(),
            ));




      default:
        return MaterialPageRoute(
          builder: (_) =>
          const Scaffold(
            body: Center(
              child: Text('Not Found..!'),
            ),
          ),
        );
    }
  }
}
