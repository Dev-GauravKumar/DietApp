import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/image_consts.dart';
import 'package:diet_app/screens/home_screen.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final pages = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: CommonAppBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          padding: EdgeInsets.all(5.0.sp),
          decoration: BoxDecoration(
              color: AppColors.loginFieldValueColor,
              borderRadius: BorderRadius.circular(40)),
          child: FloatingActionButton(
            backgroundColor: selectedIndex == 2
                ? AppColors.trackerIconColor
                : AppColors.loginPageBgColor,
            onPressed: () {
              setState(() {
                selectedIndex = 2;
              });
            },
            child: SvgPicture.asset(
              AppImages.trackerIcon,
              color: selectedIndex == 2
                  ? AppColors.loginPageBgColor
                  : AppColors.trackerIconColor,
            ),
          ),
        ),
        body: pages[selectedIndex],
        bottomNavigationBar: customBottomBar());
  }

  Widget customBottomBar() {
    return SizedBox(
      height: 70.h,
      child: BottomAppBar(
        color: AppColors.loginPageBgColor,
        elevation: 20,
        child: Padding(
          padding: EdgeInsets.only(left: 18.0.sp),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            buildTabItem(
                index: 0,
                icon: AppImages.homeIcon,
                lable: 'Home',
                selectedIcon: AppImages.selectedHome),
            buildTabItem(
                index: 1,
                icon: AppImages.chatIcon,
                lable: 'Chat',
                selectedIcon: AppImages.selectedChat),
            Container(
              margin: EdgeInsets.only(
                left: 18.sp,
                // right: 12.sp,
              ),
              width: 60.sp,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 25.sp),
                  child: Text(
                    'Tracker',
                    style: TextStyle(
                      color: selectedIndex == 2
                          ? AppColors.selectedItemColor
                          : AppColors.loginFieldValueColor,
                    ),
                  ),
                ),
              ),
            ),
            buildTabItem(
                index: 3,
                icon: AppImages.scheduleIcon,
                lable: 'Schedule',
                selectedIcon: AppImages.selectedSchedule),
            buildTabItem(
                index: 4,
                icon: AppImages.settingsIcon,
                lable: 'Settings',
                selectedIcon: AppImages.selectedSetting),
          ]),
        ),
      ),
    );
  }

  Widget buildTabItem(
      {required int index,
      required String icon,
      required String selectedIcon,
      required String lable}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: (() {
          setState(() {
            selectedIndex = index;
          });
        }),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              selectedIndex == index ? selectedIcon : icon,
            ),
            Text(
              lable,
              style: TextStyle(
                color: selectedIndex == index
                    ? AppColors.selectedItemColor
                    : AppColors.loginFieldValueColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
