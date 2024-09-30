import 'package:digiflay_task/core/helper/spacing.dart';
import 'package:digiflay_task/core/locale/app_locale.dart';
import 'package:digiflay_task/core/theme/styles.dart';
import 'package:digiflay_task/core/utils/app_assets.dart';
import 'package:digiflay_task/core/utils/app_colors.dart';
import 'package:digiflay_task/core/utils/app_strings.dart';
import 'package:digiflay_task/core/utils/commons.dart';
import 'package:digiflay_task/core/widget/custom_button.dart';
import 'package:digiflay_task/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonsComponent extends StatelessWidget {
  const ButtonsComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(
              message: LoginErrorState(state.message).message,
              state: ToastState.error,
            );
          }

          if (state is LoginSuccessState) {
            showToast(
              message: AppStrings.loginSuccessfully.tr(context),
              state: ToastState.error,
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<AuthCubit>(context);
          return Column(
            children: [
              // Login Button and Loading
              state is LoginLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ))
                  : CustomButton(
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
                width: double.infinity,
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
        },
      ),
    );
  }
}
