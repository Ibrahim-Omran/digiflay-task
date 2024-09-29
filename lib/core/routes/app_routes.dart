import 'package:digiflay_task/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'base_routes.dart';


class Routes {
  static const String intitlRoute = '/';


}

class AppRoutes {
  Route generateRouter(RouteSettings routeSettings) {

    final arguments = routeSettings.arguments;
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return BaseRoute(page: const LoginScreen());


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
