import 'package:digiflay_task/core/locale/app_locale.dart';
import 'package:digiflay_task/core/utils/app_assets.dart';
import 'package:digiflay_task/core/utils/app_colors.dart';
import 'package:digiflay_task/core/utils/app_strings.dart';
import 'package:digiflay_task/features/home/presentation/cubits/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<HomeCubit>(context);
        return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppColors.white,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.greyLite,
              currentIndex: cubit.currentIndex,
              selectedLabelStyle:
                  TextStyle(fontFamily: 'Cairo', fontSize: 14.sp),
              unselectedLabelStyle:
                  TextStyle(fontFamily: 'Cairo', fontSize: 14.sp),
              onTap: (value) {
                cubit.changeIndex(value);
              },
              elevation: 20,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppAssets.homeIconSvg,
                  ),
                  activeIcon: SvgPicture.asset(
                    AppAssets.homeIconSvg,
                    color: AppColors.primary,
                  ),
                  label: AppStrings.home.tr(context),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppAssets.textEditorIconSvg,
                  ),
                  activeIcon: SvgPicture.asset(
                    AppAssets.textEditorIconSvg,
                    color: AppColors.primary,
                  ),
                  label: AppStrings.textEditor.tr(context),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppAssets.settingIconSvg,
                  ),
                  activeIcon: SvgPicture.asset(
                    AppAssets.settingIconSvg,
                    color: AppColors.primary,
                  ),
                  label: AppStrings.setting.tr(context),
                ),
              ],
            ));
      },
    );
  }
}
