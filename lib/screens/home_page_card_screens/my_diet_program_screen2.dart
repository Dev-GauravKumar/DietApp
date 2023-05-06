import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DietProgramScreen2 extends StatelessWidget {
  const DietProgramScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 15.sp),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlueProgressCard(
                title: 'Service Program 1',
                subtitle: 'Exp : 31 Dec 2022',
                onTap: () {},
                onEditTap: () {},
                cardColor: AppColors.yellowProgressColor,
                titleColor: AppColors.trackerIconColor,
                subtitleColor: AppColors.loginPageBgColor,
                progressValue: 65,
                progressBgColor: AppColors.blackColor,
                progressValueColor: AppColors.loginPageBgColor,
              ),
              VerticalSizeBox(height: 10.sp),
              const Text(
                'Health progress',
                style: AppTextStyles.s18w700black,
              ),
              VerticalSizeBox(height: 10.sp),
              BlueProgressCard(
                title: 'You’re going to reach your goal by',
                subtitle: 'Not Available',
                onTap: () {},
                onEditTap: () {},
                cardColor: AppColors.loginPageBgColor,
                titleColor: AppColors.loginFieldValueColor,
                subtitleColor: AppColors.newAppointmentColor,
                progressValue: 0,
                progressBgColor: AppColors.loginFieldValueColor,
                progressValueColor: AppColors.loginPageTitleColor,
              ),
              VerticalSizeBox(height: 10.sp),
              const CalorieIntakeCard(
                progressValue: 45,
                todayAllowance: 1200,
                remainingAllowance: 660,
              ),
              VerticalSizeBox(height: 10.sp),
              const WeightTrackerCard(
                goalWeight: 45,
                currentWeight: 65,
                currentProgressColor: AppColors.yellowProgressColor,
                goalProgressColor: AppColors.loginPageTitleColor,
                currentPercent: 70,
                weightLeft: 9,
              ),
              VerticalSizeBox(height: 10.sp),
               const ChartCard1(
                values: [18, 12, 14],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
