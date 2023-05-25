import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/image_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/route/routes.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class WeightTrackerScreen extends StatefulWidget {
  const WeightTrackerScreen({super.key});

  @override
  State<WeightTrackerScreen> createState() => _WeightTrackerScreenState();
}

class _WeightTrackerScreenState extends State<WeightTrackerScreen> {
  late final RulerPickerController _rulerPickerController;
  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: 0);
  }

  int currentValue = 66;
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
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return setWeightDialog();
                            }));
                      }),
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

  Widget setWeightDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: AppColors.searchBoxBgColor,
      child: SizedBox(
        height: 300.sp,
        width: 120.sp,
        child: StatefulBuilder(builder:
            (BuildContext context, void Function(void Function()) setState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Set Your Weight Goal',
                style: AppTextStyles.s17w700cblack,
              ),
              // VerticalSizeBox(height: 20.sp),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: '$currentValue ',
                        style: AppTextStyles.s60w700loginBg),
                    TextSpan(
                      text: 'kg',
                      style: AppTextStyles.s30w700black
                          .copyWith(color: AppColors.loginPageBgColor),
                    ),
                  ],
                ),
              ),
              // VerticalSizeBox(height: 20.sp),
              RulerPicker(
                controller: _rulerPickerController,
                beginValue: 30,
                endValue: 50000,
                initValue: currentValue,
                scaleLineStyleList: [
                  ScaleLineStyle(
                      color: Colors.grey, width: 1.5, height: 30, scale: 0),
                  ScaleLineStyle(
                      color: Colors.grey, width: 1, height: 25, scale: 5),
                  ScaleLineStyle(
                      color: Colors.grey, width: 1, height: 15, scale: -1)
                ],
                onValueChange: (value) {
                  setState(() {
                    currentValue = value;
                  });
                },
                width: MediaQuery.of(context).size.width,
                height: 80,
                rulerMarginTop: 8,
              ),
              // VerticalSizeBox(height: 20.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                      height: 40.sp,
                      width: 130.sp,
                      buttonTitle: 'Save',
                      buttonColor: AppColors.loginPageBgColor,
                      onTap: () {}),
                  CustomButton(
                      height: 40.sp,
                      width: 130.sp,
                      buttonTitle: 'Cancel',
                      buttonColor: AppColors.darkRedColor,
                      onTap: () {}),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
