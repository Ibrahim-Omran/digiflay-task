import 'package:digiflay_task/core/helper/spacing.dart';
import 'package:digiflay_task/core/locale/app_locale.dart';
import 'package:digiflay_task/core/theme/styles.dart';
import 'package:digiflay_task/core/utils/app_colors.dart';
import 'package:digiflay_task/core/utils/app_strings.dart';
import 'package:digiflay_task/core/widget/custom_button.dart';
import 'package:digiflay_task/features/setting/presentation/component/custom_edit_text_field_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          AppStrings.editAccount.tr(context),
          style: TextStyles.font18BlackBold,
        ),
        elevation: 1,
        shadowColor: AppColors.greyVeryLite,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(50),
              const CustomEditTextFieldComponent(
                title: AppStrings.userName,
              ),
              verticalSpace(20),
              const CustomEditTextFieldComponent(
                title: AppStrings.email,
              ),
              verticalSpace(50),
              CustomButton(
                onPressed: () {},
                title: AppStrings.save.tr(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
