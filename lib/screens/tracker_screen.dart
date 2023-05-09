import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/image_consts.dart';
import 'package:diet_app/route/routes.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  final cardIcons = [
    AppImages.mealPlanImage,
    AppImages.weightTrackerImage,
    AppImages.bloodComponentImage,
  ];
  final titles = [
    'Meal Plan',
    'Weight Tracker',
    'Blood Component Tracker',
  ];
  final cardColors = [
    AppColors.loginPageBgColor,
    AppColors.trackerIconColor,
    AppColors.loginPageTitleColor
  ];
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Column(
      children: [
        TrackerProgressCard(
          title: 'Service Program 1',
          subtitle: 'Exp : 31 Dec 2022',
          onTap: () {},
          onEditTap: () {},
          cardColor: AppColors.loginPageBgColor,
          subtitleColor: AppColors.loginPageTitleColor,
          titleColor: AppColors.loginFieldValueColor,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: SizedBox(
            height: _size.height * 0.2,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cardColors.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.pushNamed(
                              context, RouteGenerator.mealsScreen,
                              arguments: 1645);
                          break;
                        case 1:
                          Navigator.pushNamed(
                            context,
                            RouteGenerator.weightTrackerScreen,
                          );
                          break;
                        case 2:
                          Navigator.pushNamed(
                            context,
                            RouteGenerator.bloodComponentTracker,
                          );
                          break;
                        default:
                      }
                    },
                    child: HomeScreenCard(
                        icon: cardIcons[index],
                        title: titles[index],
                        color: cardColors[index],
                        textColor: AppColors.loginFieldValueColor),
                  );
                })),
          ),
        ),
      ],
    );
  }
}
