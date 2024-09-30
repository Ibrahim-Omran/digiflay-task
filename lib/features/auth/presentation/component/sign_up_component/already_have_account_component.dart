import 'package:digiflay_task/core/helper/extensions.dart';
import 'package:digiflay_task/core/locale/app_locale.dart';
import 'package:digiflay_task/core/theme/styles.dart';
import 'package:digiflay_task/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountComponent extends StatelessWidget {
  const AlreadyHaveAccountComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(
          AppStrings.alreadyHaveAccount.tr(context),
          style: TextStyles.font14GrayMedium,
        ),

        TextButton(
          onPressed: (){

            context.pop();

          },
          child: Text(
            AppStrings.login.tr(context),
            style: TextStyles.font14GreenBold,
          ),
        ),
      ],
    );
  }
}
