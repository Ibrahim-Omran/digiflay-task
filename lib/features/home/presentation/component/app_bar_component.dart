
import 'package:digiflay_task/core/helper/spacing.dart';
import 'package:digiflay_task/core/locale/app_locale.dart';
import 'package:digiflay_task/core/theme/styles.dart';
import 'package:digiflay_task/core/utils/app_assets.dart';
import 'package:digiflay_task/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
          ),
          horizontalSpace(8),
          Column(
            children: [
              Text(
                'Ahmed Ali',
                style: TextStyles.font14BlackBold,
              ),
              verticalSpace(4),

              Text(
                AppStrings.welcome.tr(context),
                style: TextStyles.font14GrayMedium,
              ),
            ],
          ),

          const Spacer(),

          Image.asset(AppAssets.heartIcon),
          horizontalSpace(30),
          Image.asset(AppAssets.notificationIcon),


        ],
      ),
    );
  }
}
