import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_colors.dart';


// Toast ..
void showToast({
  required String message,
  required ToastState state,
}){
  Fluttertoast.showToast(
      msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    textColor: Colors.white,
    fontSize: 16.0
  );
}

enum ToastState {error , success , warning}
Color getStata(ToastState state){
  switch(state){
    case ToastState.error:
      return AppColors.red;
    case ToastState.success:
      return AppColors.primary;
    case ToastState.warning:
      return AppColors.primary;
  }
}


