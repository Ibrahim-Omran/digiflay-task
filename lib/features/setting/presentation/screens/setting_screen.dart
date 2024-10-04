import 'package:digiflay_task/core/database/api/end_points.dart';
import 'package:digiflay_task/core/database/bloc/global_cubit.dart';
import 'package:digiflay_task/core/database/cache/cache_helper.dart';
import 'package:digiflay_task/core/helper/extensions.dart';
import 'package:digiflay_task/core/helper/spacing.dart';
import 'package:digiflay_task/core/locale/app_locale.dart';
import 'package:digiflay_task/core/routes/app_routes.dart';
import 'package:digiflay_task/core/service/service_locator.dart';
import 'package:digiflay_task/core/theme/styles.dart';
import 'package:digiflay_task/core/utils/app_strings.dart';
import 'package:digiflay_task/features/setting/presentation/component/button_setting_component.dart';
import 'package:digiflay_task/features/setting/presentation/component/current_user_data_component.dart';
import 'package:digiflay_task/features/setting/presentation/component/setting_app_bar_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingAppBarComponent(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              const CurrentUserDataComponent(),
              verticalSpace(20),

              Text(
                AppStrings.setting.tr(context),
                style: TextStyles.font16GrayBold,
              ),

              verticalSpace(20),

              ButtonSettingComponent(
                title: AppStrings.profile.tr(context),
                icon: Icons.person,
                onTap: () {

                  context.pushNamed(Routes.editProfile);

                },
              ),

              verticalSpace(16),

              BlocBuilder<GlobalCubit, GlobalState>(
                builder: (context, state) {
                  final cubit = BlocProvider.of<GlobalCubit>(context);
                  return ButtonSettingComponent(
                    title: AppStrings.languages.tr(context),
                    icon: Icons.language_outlined,
                    lang: cubit.langCode == 'en'? 'العربيه' : 'English',
                    onTap: () {

                      cubit.changeLang(cubit.langCode == 'en'?'ar':'en');

                    },
                  );
                },
              ),


              verticalSpace(40),
              Text(
                AppStrings.contactUs.tr(context),
                style: TextStyles.font16GrayBold,
              ),


              verticalSpace(20),

              ButtonSettingComponent(
                title: AppStrings.callUs.tr(context),
                icon: Icons.wifi_calling_3_rounded,
                onTap: () {

                },
              ),

              verticalSpace(16),

              ButtonSettingComponent(
                title: AppStrings.aboutUs.tr(context),
                icon: Icons.error,
                onTap: () {

                },
              ),

              verticalSpace(100),

              ButtonSettingComponent(
                title: AppStrings.signOut.tr(context),
                icon: Icons.exit_to_app_outlined,
                onTap: () {
                  context.pushReplacementNamed(Routes.intitlRoute);
                  sl<CacheHelper>().removeData(key: ApiKeys.accessToken);
                  sl<CacheHelper>().removeData(key: AppStrings.nameKey);
                  sl<CacheHelper>().removeData(key: AppStrings.emailKey);
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
