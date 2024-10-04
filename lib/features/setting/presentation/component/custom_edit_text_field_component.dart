
import 'package:digiflay_task/core/helper/spacing.dart';
import 'package:digiflay_task/core/locale/app_locale.dart';
import 'package:digiflay_task/core/theme/styles.dart';
import 'package:digiflay_task/core/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomEditTextFieldComponent extends StatelessWidget {
  const CustomEditTextFieldComponent({
    super.key,
    required this.title,
    this.controller,
    this.validator,
  });

  final String title;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title.tr(context),
          style: TextStyles.font16GrayBold,
        ),
        verticalSpace(5),
        SizedBox(
          height: 30,
          child: CustomTextFormField(
            controller: controller,
            contentPadding: const EdgeInsets.all(16),
            validator: validator,
          ),
        )
      ],
    );
  }
}