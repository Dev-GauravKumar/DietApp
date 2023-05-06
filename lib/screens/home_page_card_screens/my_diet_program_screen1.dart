import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DietProgramScreen extends StatelessWidget {
  const DietProgramScreen({super.key});

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
              const RedProgressCard(),
              VerticalSizeBox(height: 10.sp),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    primary: AppColors.loginPageTitleColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'BOOK A SERVICE PROGRAMME',
                    style: AppTextStyles.s16w500black
                        .copyWith(color: AppColors.loginFieldValueColor),
                  ),
                ),
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
                progressValue: 0,
                todayAllowance: 0,
                remainingAllowance: 0,
              ),
              VerticalSizeBox(height: 10.sp),
              const WeightTrackerCard(
                goalWeight: 0,
                currentWeight: 0,
                currentProgressColor: AppColors.blackColor,
                goalProgressColor: AppColors.blackColor,
                currentPercent: 0,
                weightLeft: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
