import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing_helper.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/default_button.dart';

class LocationBar extends StatelessWidget {
  const LocationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Row(
          children: [
            _locationIcon(context),
            horizontalSpace(10.w),
            _locationText(textTheme),
            const Spacer(),
             DefaultButton(title: 'Change',onPressed:() {},),
          ],
        ),
      ),
    );
  }
}

Widget _locationIcon(BuildContext context) {
  return CircleAvatar(
    radius: 18.r,
    backgroundColor: Theme.of(context).colorScheme.background,
    child: const Icon(Icons.location_on_outlined, color: AppColors.black),
  );
}

Widget _locationText(TextTheme textTheme) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Send to', style: textTheme.bodySmall),
      Text('Egypt, Cairo', style: textTheme.bodyMedium),
    ],
  );
}
