import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/route/routes.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class WeightTrackerScreen extends StatelessWidget {
  const WeightTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(context, title: 'Weight Tracker'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 20.sp),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 135.sp,
                child: Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: CircularPercentIndicator(
                      radius: 120,
                      lineWidth: 5,
                      animation: true,
                      arcType: ArcType.HALF,
                      percent: 0.5,
                      arcBackgroundColor:
                          AppColors.trackerIconColor.withOpacity(0.3),
                      startAngle: 270,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: AppColors.trackerIconColor,
                      center: Padding(
                        padding: EdgeInsets.only(top: 60.sp),
                        child: Column(
                          children: const [
                            Text(
                              '58',
                              style: AppTextStyles.s32w700loginBg,
                            ),
                            Text(
                              '10 kg left to my goal',
                              style: AppTextStyles.s12w400black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '78kg',
                      style: AppTextStyles.s12w400black,
                    ),
                    Text(
                      '48kg',
                      style: AppTextStyles.s12w400black,
                    ),
                  ],
                ),
              ),
              VerticalSizeBox(height: 20.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                      height: 35.sp,
                      width: 175.sp,
                      buttonTitle: 'New Weight',
                      elevation: 5.0,
                      buttonColor: AppColors.loginPageBgColor,
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.newWeightScreen);
                      }),
                  CustomButton(
                      height: 35.sp,
                      width: 175.sp,
                      buttonTitle: 'Set Weight Goal',
                      elevation: 5.0,
                      buttonColor: AppColors.loginPageTitleColor,
                      onTap: () {}),
                ],
              ),
              VerticalSizeBox(height: 20.sp),
              const Text(
                'December 2022',
                style: AppTextStyles.s16w700black,
              ),
              VerticalSizeBox(height: 10.sp),
              const WeightPerformanceCard(
                  date: '31 Dec, Sat',
                  weight: '58',
                  progressWeight: '1kg',
                  isProgress: true),
              VerticalSizeBox(height: 10.sp),
              const WeightPerformanceCard(
                  date: '24 Dec, Sat',
                  weight: '68',
                  progressWeight: '1kg',
                  isProgress: false),
              VerticalSizeBox(height: 10.sp),
              const WeightPerformanceCard(
                  date: '17 Dec, Sat',
                  weight: '58',
                  progressWeight: '1kg',
                  isProgress: true),
              VerticalSizeBox(height: 20.sp),
              const Text(
                'November 2022',
                style: AppTextStyles.s16w700black,
              ),
              VerticalSizeBox(height: 10.sp),
              const WeightPerformanceCard(
                  date: '31 Dec, Sat',
                  weight: '58',
                  progressWeight: '1kg',
                  isProgress: true),
              VerticalSizeBox(height: 10.sp),
              const WeightPerformanceCard(
                  date: '24 Dec, Sat',
                  weight: '68',
                  progressWeight: '1kg',
                  isProgress: false),
              VerticalSizeBox(height: 10.sp),
              const WeightPerformanceCard(
                  date: '17 Dec, Sat',
                  weight: '58',
                  progressWeight: '1kg',
                  isProgress: true),
            ],
          ),
        ),
      ),
    );
  }
}
