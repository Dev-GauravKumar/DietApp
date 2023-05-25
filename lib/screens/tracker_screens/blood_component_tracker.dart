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
  String? currentType;

  List<String> types = [
    'Blood Component Type 1',
    'Blood Component Type 2',
    'Blood Component Type 3'
  ];
  List<double> values1 = [80000, 80000, 70000, 78000, 75000];
  List<double> values2 = [80000, 50000, 60000, 38000, 75000];
  bool isNextTapped = false;
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
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isNextTapped = !isNextTapped;
                          });
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 15,
                        ),
                      ),
                      HorizontalSizedBox(width: 10.sp),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isNextTapped = !isNextTapped;
                          });
                        },
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              VerticalSizeBox(height: 10.sp),
              BloodGlucoseCard(
                values: isNextTapped ? values2 : values1,
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
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return addNewRecordPopup();
                          }));
                    }),
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

  Widget addNewRecordPopup() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        height: 250.sp,
        width: 120.sp,
        child: StatefulBuilder(builder:
            (BuildContext context, void Function(void Function()) setState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'New Blood Component Record',
                style: AppTextStyles.s18w500white
                    .copyWith(color: AppColors.blackColor),
              ),
              // VerticalSizeBox(height: 20.sp),
              SizedBox(
                height: 50.sp,
                width: 250.sp,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: AppColors.searchBoxBgColor,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 10.sp, right: 10.sp, top: 5.sp),
                    child: DropdownButtonFormField<String>(
                      value: currentType,
                      items: types
                          .map((item) => DropdownMenuItem<String>(
                              value: item, child: Text(item)))
                          .toList(),
                      onChanged: (value) => setState(
                        () {
                          value != null ? currentType = value : null;
                        },
                      ),
                      iconSize: 30,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.loginPageBgColor,
                      ),
                      decoration: const InputDecoration(
                        isCollapsed: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.sp,
                width: 250.sp,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: AppColors.searchBoxBgColor,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10.sp, right: 10.sp, top: 5.sp, bottom: 10.sp),
                    child: TextField(
                      expands: false,
                      decoration: InputDecoration(
                        isCollapsed: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        suffix: Text(
                          'mg/dl',
                          style: AppTextStyles.s13w500black
                              .copyWith(color: AppColors.loginPageBgColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                      height: 40.sp,
                      width: 130.sp,
                      buttonTitle: 'Submit',
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
