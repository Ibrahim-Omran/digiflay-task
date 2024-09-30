import 'package:digiflay_task/core/helper/extensions.dart';
import 'package:digiflay_task/core/locale/app_locale.dart';
import 'package:digiflay_task/core/routes/app_routes.dart';
import 'package:digiflay_task/core/theme/styles.dart';
import 'package:digiflay_task/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class DontHaveAccountComponent extends StatelessWidget {
  const DontHaveAccountComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(
          AppStrings.donHaveAccount.tr(context),
          style: TextStyles.font14GrayMedium,
        ),

        TextButton(
          onPressed: (){

            context.pushNamed(Routes.signUp);

          },
          child: Text(
            AppStrings.signUp.tr(context),
            style: TextStyles.font14GreenBold,
          ),
        ),
      ],
    );
  }
}
