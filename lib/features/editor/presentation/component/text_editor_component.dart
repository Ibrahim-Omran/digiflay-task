

import 'package:digiflay_task/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextEditorComponent extends StatelessWidget {
   TextEditorComponent({super.key,});
  final QuillController _controller = QuillController.basic();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 300.h,
        color: AppColors.blueLite.withOpacity(0.05),
        child: Column(
          children: [
            QuillSimpleToolbar(
              controller: _controller,
              configurations: const QuillSimpleToolbarConfigurations(
                multiRowsDisplay: false,
                showFontSize: false,
                showFontFamily: false,
                showDirection: true,
                sectionDividerSpace: 10,
              ),
            ),
            Expanded(
              child: QuillEditor.basic(
                controller: _controller,
                configurations: const QuillEditorConfigurations(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
