import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/screens/schedule_screens/history_view.dart';
import 'package:diet_app/screens/schedule_screens/scheduled_view.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                    top: _size.height * 0.08,
                    left: _size.width * 0.06,
                    right: _size.width * 0.06,
                    bottom: _size.height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Appointment Schedule',
                      style: AppTextStyles.s17w700cblack.copyWith(fontSize: 22),
                    ),
                    VerticalSizeBox(height: 20.sp),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 5.0,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.searchBoxBgColor,
                          ),
                          height: 55.sp,
                          child: TabBar(
                              onTap: (value) {
                                setState(() {
                                  _controller.index = value;
                                });
                              },
                              indicator: const BoxDecoration(
                                  border: Border(bottom: BorderSide.none)),
                              controller: _controller,
                              tabs: [
                                Container(
                                    width: 150.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        color: _controller.index == 0
                                            ? AppColors.loginPageBgColor
                                            : AppColors.searchBoxBgColor,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Center(
                                      child: Text(
                                        'Scheduled',
                                        style: TextStyle(
                                            color: _controller.index == 0
                                                ? AppColors.loginFieldValueColor
                                                : AppColors.blackColor),
                                      ),
                                    )),
                                Container(
                                    width: 150.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        color: _controller.index == 1
                                            ? AppColors.loginPageBgColor
                                            : AppColors.searchBoxBgColor,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Center(
                                      child: Text(
                                        'History',
                                        style: TextStyle(
                                            color: _controller.index == 1
                                                ? AppColors.loginFieldValueColor
                                                : AppColors.blackColor),
                                      ),
                                    )),
                              ])),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            ScheduledView(),
            HistoryView(),
          ],
        ),
      ),
    );
  }
}
