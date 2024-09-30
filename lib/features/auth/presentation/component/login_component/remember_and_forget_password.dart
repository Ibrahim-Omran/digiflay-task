import 'package:digiflay_task/core/helper/spacing.dart';
import 'package:digiflay_task/core/locale/app_locale.dart';
import 'package:digiflay_task/core/theme/styles.dart';
import 'package:digiflay_task/core/utils/app_strings.dart';
import 'package:digiflay_task/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RememberAndForgetPassword extends StatelessWidget {
  const RememberAndForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<AuthCubit>(context);

          return Row(
            children: [
              IconButton(
                icon: Icon(cubit.rememberIcon),
                onPressed: () {
                  cubit.changeRememberIcon();
                },
              ),
              horizontalSpace(5),
              Text(
                AppStrings.rememberMe.tr(context),
                style: TextStyles.font14BlackMedium,
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.forgetPassword.tr(context),
                  style: TextStyles.font14GreenMedium,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
