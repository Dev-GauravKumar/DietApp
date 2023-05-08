import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rulers/rulers.dart';

class NewWeightScreen extends StatefulWidget {
  const NewWeightScreen({super.key});

  @override
  State<NewWeightScreen> createState() => _NewWeightScreenState();
}

class _NewWeightScreenState extends State<NewWeightScreen> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: simpleAppBar(context, title: 'New Weight'),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: _size.height * 0.4,
                width: _size.width,
                child: Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: AppColors.searchBoxBgColor,
                  child: CalendarDatePicker(
                    firstDate: DateTime.now(),
                    initialDate: DateTime.now(),
                    lastDate: DateTime.now(),
                    onDateChanged: (DateTime value) {},
                  ),
                ),
              ),
              VerticalSizeBox(height: 20.sp),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: '62.5 ', style: AppTextStyles.s60w700loginBg),
                    TextSpan(
                      text: 'kg',
                      style: AppTextStyles.s30w700black
                          .copyWith(color: AppColors.loginPageBgColor),
                    ),
                  ],
                ),
              ),
              RulerWidget(
                indicatorWidget: SizedBox(
                  child: VerticalDivider(
                      thickness: 5, color: AppColors.loginPageTitleColor),
                ),
                axis: Axis.horizontal,
                barsColor: AppColors.blackColor,
                largeScaleBarsInterval: 100,
                smallScaleBarsInterval: 10,
                lowerIndicatorLimit: 1,
                lowerMidIndicatorLimit: 50,
                upperMidIndicatorLimit: 65,
                upperIndicatorLimit: 100,
                scaleBackgroundColor: AppColors.loginFieldValueColor,
                height: 80,
              ),
              VerticalSizeBox(height: 20.sp),
              Card(
                elevation: 5.0,
                color: AppColors.searchBoxBgColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintStyle: AppTextStyles.s12w700black
                          .copyWith(color: AppColors.darkGreyColor),
                      hintText: 'Remarks...',
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
              VerticalSizeBox(height: 20.sp),
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
          ),
        ),
      ),
    );
  }
}
