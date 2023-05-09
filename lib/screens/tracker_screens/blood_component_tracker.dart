import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BloodComponentTracker extends StatefulWidget {
  const BloodComponentTracker({super.key});

  @override
  State<BloodComponentTracker> createState() => _BloodComponentTrackerState();
}

class _BloodComponentTrackerState extends State<BloodComponentTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(context, title: 'Blood Component Tracker'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 15.sp),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Blood Glucose Level'),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 15,
                      ),
                      HorizontalSizedBox(width: 10.sp),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                      ),
                    ],
                  ),
                ],
              ),
              VerticalSizeBox(height: 10.sp),
              BloodGlucoseCard(
                values: [80000, 80000, 70000, 78000, 75000],
              ),
              VerticalSizeBox(height: 20.sp),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                    height: 40.sp,
                    width: 250.sp,
                    buttonTitle: 'Add New Record',
                    elevation: 5.0,
                    buttonColor: AppColors.loginPageTitleColor,
                    onTap: () {}),
              ),
              VerticalSizeBox(height: 20.sp),
              const Text(
                'December 2022',
                style: AppTextStyles.s16w700black,
              ),
              VerticalSizeBox(height: 10.sp),
              BloodPerformanceCard(
                  name: 'Blood Glucose',
                  quantity: '99',
                  progressQuantity: '1mg/dl',
                  isProgress: true),
              VerticalSizeBox(height: 10.sp),
              BloodPerformanceCard(
                  name: 'Cholesterol Level',
                  quantity: '100',
                  progressQuantity: '1mg/dl',
                  isProgress: false),
              VerticalSizeBox(height: 10.sp),
              BloodPerformanceCard(
                  name: 'Blood Glucose',
                  quantity: '99',
                  progressQuantity: '1mg/dl',
                  isProgress: true),
              VerticalSizeBox(height: 20.sp),
              const Text(
                'November 2022',
                style: AppTextStyles.s16w700black,
              ),
              VerticalSizeBox(height: 10.sp),
              BloodPerformanceCard(
                  name: 'Blood Glucose',
                  quantity: '99',
                  progressQuantity: '1mg/dl',
                  isProgress: true),
              VerticalSizeBox(height: 10.sp),
              BloodPerformanceCard(
                  name: 'Cholesterol Level',
                  quantity: '100',
                  progressQuantity: '1mg/dl',
                  isProgress: false),
              VerticalSizeBox(height: 10.sp),
              BloodPerformanceCard(
                  name: 'Blood Glucose',
                  quantity: '99',
                  progressQuantity: '1mg/dl',
                  isProgress: true),
            ],
          ),
        ),
      ),
    );
  }
}
