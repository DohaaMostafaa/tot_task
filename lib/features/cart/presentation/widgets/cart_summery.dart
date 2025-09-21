import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tot_task/core/helpers/spacing_helper.dart';
import 'package:tot_task/features/cart/presentation/widgets/summary_row.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/default_button.dart';
import '../cart_cubit/cubit.dart';
import '../../domain/entities/cart_item.dart';
import 'checkout_dialogs.dart';
import 'coupon_field.dart';

class CartSummary extends StatelessWidget {
  final List<CartItem> cartItems;
  final _formKey = GlobalKey<FormState>();

  CartSummary({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    final cubit = CartCubit.get(context);
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          CouponField(formKey: _formKey, cubit: cubit),
          verticalSpace(12.h),
          SummaryRow(
            label: "Total (${cubit.totalQuantity} Items)",
            value: formatPrice(cubit.totalPrice),
          ),
          verticalSpace(8.h),
          const SummaryRow(label: "Shipping Fee", value: "\$0.00"),
          verticalSpace(8.h),
          const SummaryRow(label: "Taxes", value: "\$0.00"),
          Divider(height: 20.h, thickness: 1),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _TotalSection(cubit: cubit, textTheme: textTheme),
              SizedBox(
                width: 150.w,
                child: DefaultButton(
                  title: 'Checkout',
                  onPressed: () => showCheckoutDialog(context, cubit),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TotalSection extends StatelessWidget {
  final CartCubit cubit;
  final TextTheme textTheme;

  const _TotalSection({required this.cubit, required this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Total", style: textTheme.bodyMedium),
        Text(
          formatPrice(cubit.totalPrice),
          style: textTheme.bodyLarge,
        ),
        if (cubit.appliedDiscountCode != null)
          Text(
            "Discount applied: ${cubit.appliedDiscountCode}",
            style: textTheme.bodySmall!.copyWith(color: AppColors.primary),
          ),
      ],
    );
  }
}


String formatPrice(double price) => '\$${price.toStringAsFixed(2)}';
