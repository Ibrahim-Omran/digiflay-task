import 'package:digiflay_task/core/helper/spacing.dart';
import 'package:digiflay_task/core/locale/app_locale.dart';
import 'package:digiflay_task/core/theme/styles.dart';
import 'package:digiflay_task/core/utils/app_colors.dart';
import 'package:digiflay_task/core/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatelessWidget {
  const TextFormFieldComponent({
    super.key,
    required this.iconData,
    required this.title,
    this.suffixIconOnPressed,
    this.iconSuffix,
    this.controller,
    this.obscureText = false, this.validator,
  });


  final IconData iconData;
  final String title;
  final void Function()? suffixIconOnPressed;
  final IconData? iconSuffix;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      label: Row(
        children: [
          Icon(iconData,color: AppColors.grey,),

          horizontalSpace(3),

          Text(
            title.tr(context),
            style: TextStyles.font16GrayMedium,

          ),
        ],
      ),

      suffixIconOnPressed: suffixIconOnPressed,
      iconSuffix: iconSuffix,
      obscureText: obscureText,
      validator: validator ,

      controller: controller,

    );
  }
}
