import 'package:digiflay_task/core/helper/spacing.dart';
import 'package:digiflay_task/core/locale/app_locale.dart';
import 'package:digiflay_task/core/theme/styles.dart';
import 'package:digiflay_task/core/utils/app_colors.dart';
import 'package:digiflay_task/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerAndViewAllComponent extends StatelessWidget {
  const BestSellerAndViewAllComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Text(
            AppStrings.bestSeller.tr(context),
            style: TextStyles.font18BlackBold,
          ),
          const Spacer(),
          Text(
            AppStrings.viewAll.tr(context),
            style: TextStyles.font14GreenBold,
          ),
          horizontalSpace(5),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: AppColors.primary,
            size: 16.sp,
          ),
        ],
      ),
    );
  }
}
