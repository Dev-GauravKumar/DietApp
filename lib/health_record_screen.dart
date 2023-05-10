import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HealthRecords extends StatelessWidget {
  const HealthRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        context,
        title: 'Health Records',
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Upcoming Reports',
              style: AppTextStyles.s20w700black,
            ),
            VerticalSizeBox(height: 10.sp),
            const HealthRecordCard(
                title: 'Blood Test Report',
                subtitle:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
                date: '31/12/22'),
            VerticalSizeBox(height: 10.sp),
            const HealthRecordCard(
                title: 'Body Check Up Report',
                subtitle:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
                date: '30/12/22'),
            VerticalSizeBox(height: 20.sp),
            const Text(
              'Previous Reports',
              style: AppTextStyles.s20w700black,
            ),
            VerticalSizeBox(height: 10.sp),
            const HealthRecordCard(
                title: 'Blood Test Report',
                subtitle:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
                date: '31/12/22'),
            VerticalSizeBox(height: 10.sp),
            const HealthRecordCard(
                title: 'Body Check Up Report',
                subtitle:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
                date: '30/12/22'),
            VerticalSizeBox(height: 10.sp),
            Align(
              alignment: Alignment.centerRight,
              child: CustomButton(
                buttonColor: AppColors.loginPageTitleColor,
                buttonTitle: 'Upload Report',
                height: 30.sp,
                onTap: () {},
                width: 160.sp,
                elevation: 5.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
