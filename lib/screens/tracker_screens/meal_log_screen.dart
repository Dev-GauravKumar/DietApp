import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/image_consts.dart';

class MealLogScreen extends StatelessWidget {
  const MealLogScreen(
      {super.key, required this.kcal, required this.isMealAdded});
  final bool isMealAdded;
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
          isMealAdded
              ? Expanded(
                  child: ListView.separated(
                      itemBuilder: ((context, index) {
                        return const FoodTile(
                            title: 'Coffee with milk',
                            subtitle: '219 kcal',
                            dotColor: AppColors.selectedItemColor);
                      }),
                      separatorBuilder: ((context, index) {
                        return VerticalSizeBox(height: 10.sp);
                      }),
                      itemCount: 5),
                )
              : Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 250.sp,
                    child: Text(
                      'No new meals have been added, Search for and add your meal now!',
                      style: AppTextStyles.s16w500black.copyWith(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),
                  ),
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
      child: const TextField(
        decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none),
      ),
    );
  }
}
