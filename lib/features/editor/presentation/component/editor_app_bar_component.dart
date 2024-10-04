import 'package:digiflay_task/core/locale/app_locale.dart';
import 'package:digiflay_task/core/theme/styles.dart';
import 'package:digiflay_task/core/utils/app_colors.dart';
import 'package:digiflay_task/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

AppBar editorAppBarComponent(BuildContext context) {
  return AppBar(
    leading: const SizedBox(),
    backgroundColor: AppColors.white,
    title: Text(
      AppStrings.textEditor.tr(context),
      style: TextStyles.font18BlackBold,
    ),
    centerTitle: true,
    elevation: 1,
    shadowColor: AppColors.greyVeryLite,
  );
}

