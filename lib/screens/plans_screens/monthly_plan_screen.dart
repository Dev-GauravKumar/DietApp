import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonthlyPlanScreen extends StatelessWidget {
  const MonthlyPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.sp),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  'https://images.unsplash.com/photo-1561043433-aaf687c4cf04?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            VerticalSizeBox(height: 10.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Blue Membership',
                      style: AppTextStyles.s12w500chatPersonName
                          .copyWith(color: AppColors.darkGreyColor),
                    ),
                    VerticalSizeBox(height: 10.sp),
                    Text(
                      'Monthly Plan',
                      style: AppTextStyles.s16w500black,
                    ),
                  ],
                ),
                Container(
                  height: 80.sp,
                  width: 2,
                  color: AppColors.darkGreyColor,
                ),
                SizedBox(
                  width: 120.sp,
                  child: Column(
                    children: [
                      Text(
                        'Validity',
                        style: AppTextStyles.s12w500chatPersonName
                            .copyWith(color: AppColors.darkGreyColor),
                      ),
                      VerticalSizeBox(height: 10.sp),
                      Text(
                        '1 Month from purchase date',
                        style: AppTextStyles.s16w500black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            VerticalSizeBox(height: 10.sp),
            Divider(
              thickness: 1,
              color: AppColors.darkGreyColor,
            ),
            VerticalSizeBox(height: 15.sp),
            Text(
              'Description',
              style: AppTextStyles.s20w700black
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            VerticalSizeBox(height: 10.sp),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ',
              style: AppTextStyles.s14w500cloginFieldValue.copyWith(
                  color: AppColors.darkGreyColor, fontWeight: FontWeight.w400),
            ),
            VerticalSizeBox(height: 20),
            Text(
              'Terms and Conditions',
              style: AppTextStyles.s14w500cloginFieldValue
                  .copyWith(color: AppColors.darkGreyColor),
            ),
            VerticalSizeBox(height: 15.sp),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.circle,
                  color: AppColors.darkGreyColor,
                  size: 10,
                ),
                HorizontalSizedBox(width: 5.sp),
                Expanded(
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
                    style: AppTextStyles.s14w500cloginFieldValue.copyWith(
                        color: AppColors.darkGreyColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.circle,
                  color: AppColors.darkGreyColor,
                  size: 10,
                ),
                HorizontalSizedBox(width: 5.sp),
                Expanded(
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
                    style: AppTextStyles.s14w500cloginFieldValue.copyWith(
                        color: AppColors.darkGreyColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.circle,
                  color: AppColors.darkGreyColor,
                  size: 10,
                ),
                HorizontalSizedBox(width: 5.sp),
                Expanded(
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
                    style: AppTextStyles.s14w500cloginFieldValue.copyWith(
                        color: AppColors.darkGreyColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            VerticalSizeBox(height: 10.sp),
            Divider(
              thickness: 1,
              color: AppColors.darkGreyColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.flag,
                  color: AppColors.darkGreyColor,
                ),
                Text('Report Reward issue to Diet Ideas'),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
            Divider(
              thickness: 1,
              color: AppColors.darkGreyColor,
            ),
            VerticalSizeBox(height: 10.sp),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 50.sp,
                width: 250.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.lightGreyColor,
                ),
                child: Center(
                    child: Text(
                  'Purchase',
                  style: AppTextStyles.s18w500white
                      .copyWith(color: AppColors.blackColor),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
