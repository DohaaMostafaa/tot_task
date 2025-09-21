import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../cart_cubit/cubit.dart';
import 'cart_summery.dart';

void showCheckoutDialog(BuildContext context, CartCubit cubit) {
  final textTheme = Theme.of(context).textTheme;

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text("Confirm Order", style: textTheme.titleLarge),
      content: Text(
        "Are you sure you want to place this order for ${formatPrice(cubit.totalPrice)}?",
        style: TextStyle(fontSize: 16.sp),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            "Cancel",
            style: textTheme.bodyLarge!.copyWith(color: AppColors.primary),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            _showSuccessDialog(context, cubit);
          },
          child: Text(
            "Confirm",
            style: textTheme.bodyLarge!.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    ),
  );
}

void _showSuccessDialog(BuildContext context, CartCubit cubit) {
  final textTheme = Theme.of(context).textTheme;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      title: Text("Order Successful!", style: textTheme.titleLarge),
      content: Text(
        "Your order has been placed successfully.\n\nTotal: ${formatPrice(cubit.totalPrice)}",
        style: textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: () {
            GoRouter.of(context).goNamed('home');
            cubit.clearCart();
          },
          child: Text(
            "OK",
            style: textTheme.bodyLarge!.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    ),
  );
}