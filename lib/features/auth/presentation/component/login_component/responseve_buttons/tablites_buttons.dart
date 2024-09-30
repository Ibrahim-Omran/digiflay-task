import 'package:digiflay_task/core/helper/spacing.dart';
import 'package:digiflay_task/core/locale/app_locale.dart';
import 'package:digiflay_task/core/theme/styles.dart';
import 'package:digiflay_task/core/utils/app_assets.dart';
import 'package:digiflay_task/core/utils/app_colors.dart';
import 'package:digiflay_task/core/utils/app_strings.dart';
import 'package:digiflay_task/core/widget/custom_button.dart';
import 'package:digiflay_task/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabletsButtons extends StatelessWidget {
  const TabletsButtons({
    super.key,
    required this.cubit, required this.state,
  });

  final AuthCubit cubit;
  final AuthState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Login Button and Loading
        state is LoginLoadingState
            ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ))
            : CustomButton(
          width: 300.w,
          onPressed: () {
            if (cubit.formKeyLogin.currentState!.validate()) {
              cubit.login();
            }
          },
          title: AppStrings.login,
        ),

        verticalSpace(19),

        // OR
        Text(
          AppStrings.or.tr(context),
          style: TextStyles.font14GrayMedium,
        ),

        verticalSpace(19),

        // Google Button
        Container(
          width: 300.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: AppColors.greyLite, // لون الحواف
              width: 1, // عرض الحواف
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AppAssets.googleLogo),
              ),
              const Spacer(),
              Text(
                AppStrings.continueGoogle.tr(context),
                style: TextStyles.font14BlackBold,
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
