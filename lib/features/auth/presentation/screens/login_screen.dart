import 'package:digiflay_task/core/helper/spacing.dart';
import 'package:digiflay_task/core/locale/app_locale.dart';
import 'package:digiflay_task/core/theme/styles.dart';
import 'package:digiflay_task/core/utils/app_strings.dart';
import 'package:digiflay_task/features/auth/presentation/component/login_component/buttons_login_component.dart';
import 'package:digiflay_task/features/auth/presentation/component/login_component/dont_have_account_component.dart';
import 'package:digiflay_task/features/auth/presentation/component/login_component/email_and_password.dart';
import 'package:digiflay_task/features/auth/presentation/component/login_component/remember_and_forget_password.dart';
import 'package:digiflay_task/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (c){
        context.read<AuthCubit>().close();
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpace(50),
                // App Logo
                Image.asset(
                  AppAssets.appLogo,
                  width: 120.w,
                  height: 80.h,
                ),
                verticalSpace(40),
                Text(
                  AppStrings.signInToContinue.tr(context),
                  style: TextStyles.font19BlackMedium,
                ),
                verticalSpace(59),
                const EmailAndPasswordComponent(),
                verticalSpace(24),
                const RememberAndForgetPassword(),
                verticalSpace(30),
                const ButtonsComponent(),
                verticalSpace(30),
                const DontHaveAccountComponent(),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

