import 'package:diet_app/screens/diet_ideas_screens/blogs_screen.dart';
import 'package:diet_app/screens/diet_ideas_screens/resource_screen.dart';
import 'package:diet_app/screens/plans_screens/monthly_plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color_consts.dart';
import '../schedule_screens/history_view.dart';
import '../schedule_screens/scheduled_view.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;
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
                    top: _size.height * 0.03,
                    left: _size.width * 0.06,
                    right: _size.width * 0.06,
                    bottom: _size.height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.sp),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: AppColors.loginPageBgColor,
                              )),
                          height: 40.sp,
                          child: TabBar(
                              labelPadding:
                                  EdgeInsets.symmetric(horizontal: 5.sp),
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
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                        color: _controller.index == 0
                                            ? AppColors.loginPageBgColor
                                            : AppColors.loginFieldValueColor,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Center(
                                      child: Text(
                                        'Monthly Plan',
                                        style: TextStyle(
                                            color: _controller.index == 0
                                                ? AppColors.loginFieldValueColor
                                                : AppColors.blackColor),
                                      ),
                                    )),
                                Container(
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                        color: _controller.index == 1
                                            ? AppColors.loginPageBgColor
                                            : AppColors.loginFieldValueColor,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Center(
                                      child: Text(
                                        'Annual Plan',
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
            MonthlyPlanScreen(),
            ResourceScreen(),
          ],
        ),
      ),
    );
  }
}
