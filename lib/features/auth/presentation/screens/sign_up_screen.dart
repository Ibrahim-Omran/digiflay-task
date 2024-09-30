import 'package:digiflay_task/core/helper/spacing.dart';
import 'package:digiflay_task/core/locale/app_locale.dart';
import 'package:digiflay_task/core/theme/styles.dart';
import 'package:digiflay_task/core/utils/app_assets.dart';
import 'package:digiflay_task/core/utils/app_strings.dart';
import 'package:digiflay_task/features/auth/presentation/component/sign_up_component/already_have_account_component.dart';
import 'package:digiflay_task/features/auth/presentation/component/sign_up_component/botton_sign_up_component.dart';
import 'package:digiflay_task/features/auth/presentation/component/sign_up_component/email_and_password_and_confirm_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(70),
              // App Logo
              Image.asset(
                AppAssets.appLogo,
                width: 120.w,
                height: 80.h,
              ),
              verticalSpace(40),
              Text(
                AppStrings.createNewAccount.tr(context),
                style: TextStyles.font19BlackMedium,
              ),

              verticalSpace(40),
              const EmailAndPasswordAndConfirmPassword(),

              verticalSpace(60),

              const ButtonSignUpComponent(),

              verticalSpace(10),

              const AlreadyHaveAccountComponent(),


            ],
          ),
        ),
      ),
    );
  }
}


