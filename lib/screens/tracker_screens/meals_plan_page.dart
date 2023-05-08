import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/screens/diet_ideas_screens/blogs_screen.dart';
import 'package:diet_app/screens/diet_ideas_screens/resource_screen.dart';
import 'package:diet_app/screens/tracker_screens/meal_log_screen.dart';
import 'package:diet_app/screens/tracker_screens/meal_plan_screen.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealPlanPage extends StatefulWidget {
  const MealPlanPage({super.key});

  @override
  State<MealPlanPage> createState() => _MealPlanPageState();
}

class _MealPlanPageState extends State<MealPlanPage>
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
      appBar: simpleAppBar(context, title: 'Breakfast Meal Plan'),
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
                                        'Meal Plan',
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
                                        'Meal Log',
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
            MealPlanScreen(
              kcal: '1645',
            ),
            MealLogScreen(
              kcal: '0',
              isMealAdded: false,
            ),
          ],
        ),
      ),
    );
  }
}
