import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceProgrammeScreen extends StatelessWidget {
  const ServiceProgrammeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: simpleAppBar(context, title: 'Service Programme'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: _size.height * 0.025),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ServiceProgrammeTopCard(
              date: 'Dec 20, 2022',
              cutOffDate: 'Dec 31 2022',
            ),
            VerticalSizeBox(height: 15.sp),
            Expanded(
              child: ListView.separated(
                itemCount: 3,
                itemBuilder: ((context, index) {
                  return index == 2
                      ? Column(
                          children: [
                            ServiceProgrammeDetailCard(
                              name: 'Service Programme ${index + 1}',
                              description:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
                              price: 'RM 200',
                              isActive: index == 0 ? true : false,
                            ),
                            VerticalSizeBox(height: 10.sp),
                            SizedBox(
                              height: 55.sp,
                              width: 300.sp,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  primary: AppColors.loginPageTitleColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                child: const Text('Continue with Payment',
                                    style: AppTextStyles.s18w500white),
                              ),
                            ),
                          ],
                        )
                      : ServiceProgrammeDetailCard(
                          name: 'Service Programme ${index + 1}',
                          description:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
                          price: 'RM 200',
                          isActive: index == 0 ? true : false,
                        );
                }),
                separatorBuilder: (BuildContext context, int index) {
                  return VerticalSizeBox(height: 10.sp);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
