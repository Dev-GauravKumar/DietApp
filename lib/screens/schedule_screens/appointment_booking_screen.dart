import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/image_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppointmentBookingScreen extends StatefulWidget {
  const AppointmentBookingScreen({super.key});

  @override
  State<AppointmentBookingScreen> createState() =>
      _AppointmentBookingScreenState();
}

class _AppointmentBookingScreenState extends State<AppointmentBookingScreen> {
  DateTime selectedDate = DateTime.now();
  String selectedTime = '11:30 am';
  final times = [
    '10:00 am',
    '10:45 am',
    '11:30 am',
    '12:15 pm',
    '1:00 pm',
    '1:30 pm',
  ];
  final availables = [1, 4];
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: simpleAppBar(context, title: 'Appointment Booking'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              VerticalSizeBox(
                height: 25.sp,
              ),
              const Text(
                'Time',
                style: AppTextStyles.s20w700black,
              ),
              VerticalSizeBox(height: 10.sp),
              SizedBox(
                  height: 40.sp,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: times.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: times[index] == selectedTime
                              ? AppColors.loginPageBgColor
                              : null,
                          border: Border.all(
                              color: availables.contains(index)
                                  ? AppColors.loginPageTitleColor
                                  : times[index] == selectedTime
                                      ? AppColors.loginPageBgColor
                                      : AppColors.darkGreyColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 30.sp,
                        child: Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: Center(
                            child: Text(
                              times[index],
                              style: TextStyle(
                                  color: availables.contains(index)
                                      ? AppColors.loginPageTitleColor
                                      : times[index] == selectedTime
                                          ? AppColors.loginFieldValueColor
                                          : AppColors.darkGreyColor),
                            ),
                          ),
                        ),
                      );
                    }),
                    separatorBuilder: (BuildContext context, int index) {
                      return HorizontalSizedBox(
                        width: 10.sp,
                      );
                    },
                  )),
              VerticalSizeBox(height: 20.sp),
              SizedBox(
                height: _size.height * 0.4,
                width: _size.width,
                child: Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: AppColors.searchBoxBgColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 20.sp, horizontal: 20.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'service name',
                          style: AppTextStyles.s14w500cloginFieldValue
                              .copyWith(color: AppColors.blackColor),
                        ),
                        VerticalSizeBox(height: 10.sp),
                        Text(
                          'Service Programme 1',
                          style: AppTextStyles.s18w500white
                              .copyWith(color: AppColors.blackColor),
                        ),
                        VerticalSizeBox(height: 20.sp),
                        SizedBox(
                          height: 80.sp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.sp),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            AppImages.calendarIcon),
                                        HorizontalSizedBox(width: 10.sp),
                                        Text(
                                          'Date',
                                          style: AppTextStyles
                                              .s14w500cloginFieldValue
                                              .copyWith(
                                                  color: AppColors.blackColor),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Dec 18 2022',
                                      style: AppTextStyles.s16w500black,
                                    ),
                                  ],
                                ),
                              ),
                              VerticalDivider(
                                color: AppColors.blackColor,
                                thickness: 1,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.sp),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(AppImages.clockIcon),
                                        HorizontalSizedBox(width: 10.sp),
                                        Text(
                                          'Time',
                                          style: AppTextStyles
                                              .s14w500cloginFieldValue
                                              .copyWith(
                                                  color: AppColors.blackColor),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      selectedTime,
                                      style: AppTextStyles.s16w500black,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalSizeBox(height: 20.sp),
                        SizedBox(
                          height: 55.sp,
                          width: 316.sp,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 5,
                              primary: AppColors.loginPageTitleColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            child: Text(
                              'RESCHEDULE APPOINTMENT',
                              style: AppTextStyles.s18w500white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
