
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';


extension Context on BuildContext{

 styleBold() {
  return Theme.of(this).textTheme.displayMedium!.copyWith(
    color: AppColors.black,
  );
}

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(
        routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
        routeName, predicate, arguments: arguments);
  }

  void pop()=> Navigator.of(this).pop();
}



