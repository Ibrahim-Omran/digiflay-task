import 'package:digiflay_task/core/helper/extensions.dart';
import 'package:digiflay_task/core/locale/app_locale.dart';
import 'package:digiflay_task/core/routes/app_routes.dart';
import 'package:digiflay_task/core/utils/app_colors.dart';
import 'package:digiflay_task/core/utils/app_strings.dart';
import 'package:digiflay_task/core/utils/commons.dart';
import 'package:digiflay_task/core/widget/custom_button.dart';
import 'package:digiflay_task/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonSignUpComponent extends StatelessWidget {
  const ButtonSignUpComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignUpErrorState) {
            showToast(
              message: SignUpErrorState(state.message).message,
              state: ToastState.error,
            );
          }

          if (state is SignUpSuccessState) {
            showToast(
              message: AppStrings.signUpSuccessfully.tr(context),
              state: ToastState.success,
            );
            context.pop();
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<AuthCubit>(context);
          final width = MediaQuery.of(context).size.width;

          return LayoutBuilder(
            builder: (context, constraints) {
              if (width < 500) {
                return Column(
                  children: [
                    // SignUp Button and Loading
                    state is SignUpLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ))
                        : CustomButton(
                            onPressed: () {
                              if (cubit.formKeySignUp.currentState!
                                  .validate()) {
                                cubit.signUp();
                              }
                            },
                            title: AppStrings.signUp,
                          ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    // SignUp Button and Loading
                    state is SignUpLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ))
                        : CustomButton(
                            width: 500.w,
                            onPressed: () {
                              if (cubit.formKeySignUp.currentState!
                                  .validate()) {
                                cubit.signUp();
                              }
                            },
                            title: AppStrings.signUp,
                          ),
                  ],
                );
              }
            },
          );
        },
      ),
    );
  }
}
