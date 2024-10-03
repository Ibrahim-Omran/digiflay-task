import 'package:digiflay_task/core/service/service_locator.dart';
import 'package:digiflay_task/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:digiflay_task/features/auth/presentation/screens/login_screen.dart';
import 'package:digiflay_task/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:digiflay_task/features/editor/presentation/screens/text_editor_screen.dart';
import 'package:digiflay_task/features/home/presentation/cubits/home_cubit.dart';
import 'package:digiflay_task/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_routes.dart';


class Routes {
  static const String intitlRoute = '/';
  static const String signUp = '/signUp';
  static const String home = '/home';
  static const String textEditor = '/textEditor';


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

      case Routes.home:
        return BaseRoute(
            page: BlocProvider(
              create: (context) => sl<HomeCubit>()..getProducts(),
              child: const HomeScreen(),
            ));

      case Routes.textEditor:
        return BaseRoute(
            page:  TextEditorScreen());




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
