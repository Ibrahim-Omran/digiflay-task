import 'package:digiflay_task/core/helper/spacing.dart';
import 'package:digiflay_task/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerComponent extends StatelessWidget {
  const BannerComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Image.asset(
              height: 173.h,
              width: 300.w,
              AppAssets.bannerImg,
              fit: BoxFit.fill,
            ),
            horizontalSpace(15),
            Image.asset(
              height: 173.h,
              width: 300.w,
              AppAssets.bannerImg,
              fit: BoxFit.fill,

            ),
          ],
        ),
      ),
    );
  }
}
