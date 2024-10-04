import 'package:digiflay_task/core/database/cache/cache_helper.dart';
import 'package:digiflay_task/core/helper/spacing.dart';
import 'package:digiflay_task/core/service/service_locator.dart';
import 'package:digiflay_task/core/theme/styles.dart';
import 'package:digiflay_task/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class CurrentUserDataComponent extends StatelessWidget {
  const CurrentUserDataComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 25,
        ),
        horizontalSpace(8),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sl<CacheHelper>().getData(key: AppStrings.nameKey),
              style: TextStyles.font14BlackBold,
            ),
            verticalSpace(4),

            Text(
              sl<CacheHelper>().getData(key: AppStrings.emailKey),
              style: TextStyles.font14GrayMedium,
            ),
          ],
        ),



      ],
    );
  }
}
