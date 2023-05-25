import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/image_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/health_record_screen.dart';
import 'package:diet_app/providers/pageProvider.dart';
import 'package:diet_app/screens/chat_screens/chat_screen.dart';
import 'package:diet_app/screens/diet_ideas_screens/diet_idea_screen.dart';
import 'package:diet_app/screens/feedback_screens/feedbacks_screen.dart';
import 'package:diet_app/screens/home_page_card_screens/my_diet_program_screen2.dart';
import 'package:diet_app/screens/home_screen.dart';
import 'package:diet_app/screens/notification_screen.dart';
import 'package:diet_app/screens/plans_screens/plan_screen.dart';
import 'package:diet_app/screens/schedule_screens/schedule_screen.dart';
import 'package:diet_app/screens/settings_screens/settings_screen.dart';
import 'package:diet_app/screens/tracker_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  bool isNotificationSelected = false;
  bool showAppbar = true;
  final pages = [
    HomeScreen(),
    ChatScreen(),
    TrackerScreen(),
    ScheduleScreen(),
    SettingsScreen(),
    NotificationScreen(),
    FeedbacksScreen(),
    DietIdeaScreen(),
    DietProgramScreen2(),
    PlansScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PageProvider>(context);
    final pageIndex = Provider.of<PageProvider>(context).pageIndex;
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return WillPopScope(
      onWillPop: () async {
        if (provider.pageIndex != 0) {
          provider.changePageIndex(0);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
          extendBody: true,
          appBar: showAppbar ? commonAppBar(context) : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: showFab
              ? Container(
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
                        isNotificationSelected = false;
                        selectedIndex = 2;
                        provider.changePageIndex(2);
                        showAppbar = true;
                      });
                    },
                    child: SvgPicture.asset(
                      AppImages.trackerIcon,
                      color: selectedIndex == 2
                          ? AppColors.loginPageBgColor
                          : AppColors.trackerIconColor,
                    ),
                  ),
                )
              : const SizedBox(),
          body: pages[pageIndex],
          bottomNavigationBar: customBottomBar()),
    );
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
    final provider = Provider.of<PageProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: (() {
          setState(() {
            if (index == 0) {
              showAppbar = true;
            } else {
              showAppbar = false;
            }
            isNotificationSelected = false;
            selectedIndex = index;
            provider.changePageIndex(index);
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

  PreferredSizeWidget commonAppBar(BuildContext context) {
    final provider = Provider.of<PageProvider>(context);
    return PreferredSize(
      preferredSize: Size.fromHeight(104.sp),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.appBarBackgroundColor,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        height: 50.sp,
                        width: 50.sp,
                        color: AppColors.profileBackgroundColor,
                        child: Image.asset(
                          AppImages.appBarProfileImage,
                          fit: BoxFit.contain,
                        )),
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      'Hello, Masfara!',
                      style: AppTextStyles.s17w700cblack,
                    ),
                    Text(
                      'Today Wed, Dec 28',
                      style: AppTextStyles.s16w600cloginBg
                          .copyWith(fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (() {
                    setState(() {
                      selectedIndex = 5;
                      isNotificationSelected = true;
                      provider.changePageIndex(5);
                    });
                  }),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Card(
                            elevation: 5.0,
                            color: isNotificationSelected
                                ? AppColors.loginPageBgColor
                                : AppColors.loginFieldValueColor,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child: SvgPicture.asset(
                                isNotificationSelected
                                    ? AppImages.selectedNotificationIcon
                                    : AppImages.appBarBellIcon,
                              ),
                            ),
                          ),
                        ),
                        isNotificationSelected
                            ? const SizedBox()
                            : Positioned(
                                right: 2.sp,
                                top: 5.sp,
                                child: const Icon(
                                  Icons.circle,
                                  color: Colors.red,
                                  size: 6,
                                ),
                              )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
