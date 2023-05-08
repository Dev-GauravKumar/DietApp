import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/image_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/route/routes.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MealPlanScreen extends StatelessWidget {
  const MealPlanScreen({super.key, required this.kcal});
  final String kcal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp),
      child: Column(
        children: [
          searchBox(),
          VerticalSizeBox(height: 30.sp),
          Align(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(AppImages.dashedCircleImage),
                Column(
                  children: [
                    Text(
                      kcal,
                      style: AppTextStyles.s44w700loginBg,
                    ),
                    Text(
                      'Kcal Eaten',
                      style: AppTextStyles.s12w400black.copyWith(
                        color: AppColors.darkGreyColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          VerticalSizeBox(height: 30.sp),
          Expanded(
            child: ListView.separated(
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteGenerator.addMealScreen);
                    },
                    child: const FoodTile(
                        title: 'Coffee with milk',
                        subtitle: '219 kcal',
                        dotColor: AppColors.selectedItemColor),
                  );
                }),
                separatorBuilder: ((context, index) {
                  return VerticalSizeBox(height: 10.sp);
                }),
                itemCount: 5),
          ),
        ],
      ),
    );
  }

  Widget searchBox() {
    return Container(
      height: 40.sp,
      decoration: BoxDecoration(
          color: AppColors.searchBoxBgColor,
          borderRadius: BorderRadius.circular(5)),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none),
      ),
    );
  }
}
