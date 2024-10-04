
import 'package:digiflay_task/core/helper/spacing.dart';
import 'package:digiflay_task/core/theme/styles.dart';
import 'package:digiflay_task/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonSettingComponent extends StatelessWidget {
  const ButtonSettingComponent({
    super.key, required this.title, this.lang, required this.icon, this.onTap,
  });

  final String title;

  final String? lang;

  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            color: AppColors.primary.withOpacity(0.04),
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 30.sp,
            ),
          ),

          horizontalSpace(20),
          Text(
            title,
            style: TextStyles.font14BlackBold,
          ),


          const Spacer(),

          lang != null ? Text(
            lang!,
            style: TextStyles.font14GreenMedium.copyWith(fontSize: 16),
          ) : const SizedBox(),

          horizontalSpace(15),

          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 23.sp,
          ),

        ],
      ),
    );
  }
}
