import 'package:digiflay_task/core/locale/app_locale.dart';
import 'package:digiflay_task/core/theme/styles.dart';
import 'package:digiflay_task/core/utils/app_assets.dart';
import 'package:digiflay_task/core/utils/app_colors.dart';
import 'package:digiflay_task/core/utils/app_strings.dart';
import 'package:digiflay_task/core/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          TextFormFieldHomeComponent(
            controller: TextEditingController(),
            filterOnPressed: (){
              // filter Logic
            },
          ),
        ],
      ),
    );
  }
}

class TextFormFieldHomeComponent extends StatelessWidget {
  const TextFormFieldHomeComponent({
    super.key, this.filterOnPressed, this.controller,
  });

  final void Function()? filterOnPressed;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextFormField(
        controller: controller,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            AppAssets.searchIconSvg,
          ),
        ),
        suffixIcon: Container(
          width: 60.w,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
          ),
          child: IconButton(
            onPressed: filterOnPressed,
            icon: SvgPicture.asset(
              AppAssets.filtertionSvg,
              height: 25,
            ),
          ),
        ),
        hintText: AppStrings.searchHere.tr(context),
        hintStyle: TextStyles.font14GrayMedium,
        fillColor: AppColors.whiteLite,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            width: 0,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
