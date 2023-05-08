import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/image_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  String? currentValue = '1';
  List<String> dropDownValues = ['1', '2', '3'];
  String? currentMeasurements = 'Teaspoon1';
  List<String> measurementsValues = ['Teaspoon1', 'Teaspoon2', 'Teaspoon3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(context, title: 'Coffee With Milk'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 20.sp),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Text(
                  'Intake Portion',
                  style: AppTextStyles.s24w700white
                      .copyWith(color: AppColors.blackColor),
                ),
              ),
              VerticalSizeBox(height: 10.sp),
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20.sp),
                  child: Column(
                    children: [
                      Container(
                        height: 50.sp,
                        width: 400,
                        decoration: const BoxDecoration(
                          color: AppColors.loginPageBgColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15.sp),
                          child: Text(
                            'Coffee',
                            style: AppTextStyles.s18w500white,
                          ),
                        ),
                      ),
                      VerticalSizeBox(height: 10.sp),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.sp),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.sp),
                                      child: Text('Quantity'),
                                    ),
                                    VerticalSizeBox(height: 5.sp),
                                    SizedBox(
                                      width: 90.sp,
                                      height: 35.sp,
                                      child: DropdownButtonFormField<String>(
                                        value: currentValue,
                                        items: dropDownValues
                                            .map(
                                              (item) =>
                                                  DropdownMenuItem<String>(
                                                value: item,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20.sp),
                                                  child: Text(
                                                    item,
                                                    style: AppTextStyles
                                                        .s12w400black,
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (value) => setState(
                                          () {
                                            value != null
                                                ? currentValue = value
                                                : null;
                                          },
                                        ),
                                        iconSize: 18,
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: AppColors.blackColor,
                                        ),
                                        dropdownColor:
                                            AppColors.searchBoxBgColor,
                                        style: AppTextStyles
                                            .s14w500cloginFieldValue,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: AppColors.searchBoxBgColor,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.sp),
                                      child: Text('Measurements'),
                                    ),
                                    VerticalSizeBox(height: 5.sp),
                                    SizedBox(
                                      width: 150.sp,
                                      height: 35.sp,
                                      child: DropdownButtonFormField<String>(
                                        value: currentMeasurements,
                                        items: measurementsValues
                                            .map(
                                              (item) =>
                                                  DropdownMenuItem<String>(
                                                value: item,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20.sp),
                                                  child: Text(
                                                    item,
                                                    style: AppTextStyles
                                                        .s12w400black,
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (value) => setState(
                                          () {
                                            value != null
                                                ? currentMeasurements = value
                                                : null;
                                          },
                                        ),
                                        iconSize: 18,
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: AppColors.blackColor,
                                        ),
                                        dropdownColor:
                                            AppColors.searchBoxBgColor,
                                        style: AppTextStyles
                                            .s14w500cloginFieldValue,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: AppColors.searchBoxBgColor,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              VerticalSizeBox(height: 15.sp),
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20.sp),
                  child: Column(
                    children: [
                      Container(
                        height: 50.sp,
                        width: 400,
                        decoration: const BoxDecoration(
                          color: AppColors.trackerIconColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15.sp),
                          child: Text(
                            'Milk',
                            style: AppTextStyles.s18w500white,
                          ),
                        ),
                      ),
                      VerticalSizeBox(height: 10.sp),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.sp),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.sp),
                                      child: Text('Quantity'),
                                    ),
                                    VerticalSizeBox(height: 5.sp),
                                    SizedBox(
                                      width: 90.sp,
                                      height: 35.sp,
                                      child: DropdownButtonFormField<String>(
                                        value: currentValue,
                                        items: dropDownValues
                                            .map(
                                              (item) =>
                                                  DropdownMenuItem<String>(
                                                value: item,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20.sp),
                                                  child: Text(
                                                    item,
                                                    style: AppTextStyles
                                                        .s12w400black,
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (value) => setState(
                                          () {
                                            value != null
                                                ? currentValue = value
                                                : null;
                                          },
                                        ),
                                        iconSize: 18,
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: AppColors.blackColor,
                                        ),
                                        dropdownColor:
                                            AppColors.searchBoxBgColor,
                                        style: AppTextStyles
                                            .s14w500cloginFieldValue,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: AppColors.searchBoxBgColor,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.sp),
                                      child: Text('Measurements'),
                                    ),
                                    VerticalSizeBox(height: 5.sp),
                                    SizedBox(
                                      width: 150.sp,
                                      height: 35.sp,
                                      child: DropdownButtonFormField<String>(
                                        value: currentMeasurements,
                                        items: measurementsValues
                                            .map(
                                              (item) =>
                                                  DropdownMenuItem<String>(
                                                value: item,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20.sp),
                                                  child: Text(
                                                    item,
                                                    style: AppTextStyles
                                                        .s12w400black,
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (value) => setState(
                                          () {
                                            value != null
                                                ? currentMeasurements = value
                                                : null;
                                          },
                                        ),
                                        iconSize: 18,
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: AppColors.blackColor,
                                        ),
                                        dropdownColor:
                                            AppColors.searchBoxBgColor,
                                        style: AppTextStyles
                                            .s14w500cloginFieldValue,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: AppColors.searchBoxBgColor,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              VerticalSizeBox(height: 30.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Text(
                  'Macronutrients Breakdown',
                  style: AppTextStyles.s24w700white
                      .copyWith(color: AppColors.blackColor),
                ),
              ),
              VerticalSizeBox(height: 15.sp),
              Card(
                color: AppColors.searchBoxBgColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.sp, vertical: 25.sp),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppImages.protienIcon),
                              HorizontalSizedBox(width: 20.sp),
                              Text('Proteins'),
                            ],
                          ),
                          Text('3g'),
                        ],
                      ),
                      VerticalSizeBox(height: 20.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppImages.fatIcon),
                              HorizontalSizedBox(width: 20.sp),
                              Text('Fats'),
                            ],
                          ),
                          Text('0.3g'),
                        ],
                      ),
                      VerticalSizeBox(height: 20.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppImages.carbIcon),
                              HorizontalSizedBox(width: 20.sp),
                              Text('Carbs'),
                            ],
                          ),
                          Text('3g'),
                        ],
                      ),
                      VerticalSizeBox(height: 20.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppImages.caloriesIcon),
                              HorizontalSizedBox(width: 20.sp),
                              Text('Total Calories'),
                            ],
                          ),
                          Text('70 kcal'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              VerticalSizeBox(height: 10.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                      height: 40.sp,
                      width: 130.sp,
                      buttonTitle: 'Add Meal',
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
          ),
        ),
      ),
    );
  }
}
