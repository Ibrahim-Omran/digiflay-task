import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onPressed,
    required this.title,
    this.height,
    this.width,
    super.key, required this.icon, this.fontSize,
  });

  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final String title;
  final IconData icon;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.primary,
      onTap: onPressed,
      child: Container(
        height: height ?? 44.h,
        width: width ?? double.infinity,
        decoration: ShapeDecoration(
          color: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Spacer(flex: 1,),
                  Text(
                    title,
                    style: Theme
                        .of(context)
                        .textTheme
                        .displayMedium!.copyWith(fontSize: fontSize ?? 15),
                  ),

                  const Spacer(),

                  Icon(
                      icon,
                    size: 30.sp,
                    color: AppColors.white,
                  ),

                ],
              ),
            )),
      ),
    );
  }
}
