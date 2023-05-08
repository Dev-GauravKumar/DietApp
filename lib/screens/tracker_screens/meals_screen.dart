import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/image_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/route/routes.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.kcal});
  final int kcal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(context, title: 'Meals'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 15.sp),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(AppImages.dashedCircleImage),
                    Column(
                      children: [
                        Text(
                          kcal.toString(),
                          style: AppTextStyles.s44w700loginBg,
                        ),
                        Text(
                          'Kcal available',
                          style: AppTextStyles.s12w400black.copyWith(
                            color: AppColors.darkGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              VerticalSizeBox(height: 10.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImages.forkIcon),
                  HorizontalSizedBox(width: 10.sp),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '2181',
                        style: AppTextStyles.s32w700loginBg,
                      ),
                      Text(
                        'Eaten Kcal',
                        style: AppTextStyles.s12w400black.copyWith(
                          color: AppColors.darkGreyColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              VerticalSizeBox(height: 30.sp),
              Text(
                'Macronutrients Breakdown',
                style: AppTextStyles.s24w700white.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
              VerticalSizeBox(height: 10.sp),
              const MacronutrientsCard(),
              VerticalSizeBox(height: 20.sp),
              const Text(
                'Daily Meals',
                style: AppTextStyles.s20w700black,
              ),
              VerticalSizeBox(height: 10.sp),
              // Expanded(
              //   child: ListView.separated(
              //     itemBuilder: ((context, index) {
              //       return AddMealsTile(
              //         title: 'Breakfast',
              //         subtitle: 'Recomended 447 Kcal',
              //         tileColor: AppColors.loginPageBgColor,
              //       );
              //     }),
              //     itemCount: 4,
              //     separatorBuilder: (BuildContext context, int index) {
              //       return VerticalSizeBox(
              //         height: 10.sp,
              //       );
              //     },
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteGenerator.mealsPlanPage);
                },
                child: const AddMealsTile(
                  title: 'Breakfast',
                  subtitle: 'Recomended 447 Kcal',
                  tileColor: AppColors.loginPageBgColor,
                ),
              ),
              VerticalSizeBox(height: 10.sp),
              const AddMealsTile(
                title: 'Lunch',
                subtitle: 'Recomended 447 Kcal',
                tileColor: AppColors.trackerIconColor,
              ),
              VerticalSizeBox(height: 10.sp),

              const AddMealsTile(
                title: 'Dinner',
                subtitle: 'Recomended 447 Kcal',
                tileColor: AppColors.loginPageTitleColor,
              ),
              VerticalSizeBox(height: 10.sp),
              const AddMealsTile(
                title: 'Snack',
                subtitle: 'Recomended 447 Kcal',
                tileColor: AppColors.loginPageBgColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
