
import 'package:digiflay_task/core/helper/app_regex.dart';
import 'package:digiflay_task/core/helper/spacing.dart';
import 'package:digiflay_task/core/utils/app_strings.dart';
import 'package:digiflay_task/features/auth/presentation/component/text_form_field_component.dart';
import 'package:digiflay_task/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailAndPasswordComponent extends StatelessWidget {
  const EmailAndPasswordComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final cubit =  BlocProvider.of<AuthCubit>(context);
          final width = MediaQuery.of(context).size.width;

          return Form(
            key: cubit.formKeyLogin,
            child: LayoutBuilder(
              builder: (context, constraints) {
                if(width < 500){
                  return Column(
                    children: [
                      TextFormFieldComponent(
                        controller: cubit.emailController,
                        iconData: Icons.email,
                        title: AppStrings.email,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !AppRegex.isEmailValid(value)) {
                            return 'please enter valid email';
                          }
                          return null;
                        },

                      ),

                      verticalSpace(24),

                      TextFormFieldComponent(
                        controller: cubit.passwordController,
                        iconData: Icons.lock,
                        title: AppStrings.password,
                        obscureText: cubit.isLoginPasswordSowing,
                        iconSuffix: cubit.suffixIcon,
                        suffixIconOnPressed: () {
                          cubit.changeLoginPasswordSuffixIcon();
                        },
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ) {
                            return 'please enter valid password';
                          }
                          return null;
                        },
                      ),
                    ],
                  );
                }else{
                  return SizedBox(
                    width: 700.w,
                    child: Column(
                      children: [
                        TextFormFieldComponent(
                          controller: cubit.emailController,
                          iconData: Icons.email,
                          title: AppStrings.email,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !AppRegex.isEmailValid(value)) {
                              return 'please enter valid email';
                            }
                            return null;
                          },

                        ),

                        verticalSpace(24),

                        TextFormFieldComponent(
                          controller: cubit.passwordController,
                          iconData: Icons.lock,
                          title: AppStrings.password,
                          obscureText: cubit.isLoginPasswordSowing,
                          iconSuffix: cubit.suffixIcon,
                          suffixIconOnPressed: () {
                            cubit.changeLoginPasswordSuffixIcon();
                          },
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ) {
                              return 'please enter valid password';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  );
                }

              },
            ),
          );
        },
      ),
    );
  }
}

