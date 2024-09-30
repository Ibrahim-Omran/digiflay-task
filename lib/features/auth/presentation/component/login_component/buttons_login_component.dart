import 'package:digiflay_task/core/locale/app_locale.dart';
import 'package:digiflay_task/core/utils/app_strings.dart';
import 'package:digiflay_task/core/utils/commons.dart';
import 'package:digiflay_task/features/auth/presentation/component/login_component/responseve_buttons/mobiles_buttons.dart';
import 'package:digiflay_task/features/auth/presentation/component/login_component/responseve_buttons/tablites_buttons.dart';
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
          final width = MediaQuery.of(context).size.width;
          return LayoutBuilder(
            builder: (context, constraints) {
              if(width < 500){
                return MobileButtons(cubit: cubit,state: state,);
              }else{
                return TabletsButtons(cubit: cubit,state: state,);
              }

            },
          );
        },
      ),
    );
  }
}


