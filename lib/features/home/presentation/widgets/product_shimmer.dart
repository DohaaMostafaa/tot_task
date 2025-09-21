import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tot_task/core/widgets/base_shimmer.dart';
import '../../../../core/theme/app_colors.dart';

class ProductShimmer extends BaseShimmer {
  const ProductShimmer({super.key});


  @override
  Widget buildShimmer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }
}
