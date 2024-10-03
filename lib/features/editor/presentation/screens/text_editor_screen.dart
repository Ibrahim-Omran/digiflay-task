import 'package:digiflay_task/core/helper/spacing.dart';
import 'package:digiflay_task/core/locale/app_locale.dart';
import 'package:digiflay_task/core/theme/styles.dart';
import 'package:digiflay_task/core/utils/app_strings.dart';
import 'package:digiflay_task/features/editor/presentation/component/editor_app_bar_component.dart';
import 'package:digiflay_task/features/editor/presentation/component/text_editor_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextEditorScreen extends StatelessWidget {
  const TextEditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: editorAppBarComponent(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(30),
              Text(
                AppStrings.introduceYourSelf.tr(context),
                style: TextStyles.font18BlackBold,
              ),
              verticalSpace(25),
              TextEditorComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
