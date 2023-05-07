import 'package:carousel_slider/carousel_slider.dart';
import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/image_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlogsScreen extends StatefulWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  final banners = [
    'https://images.unsplash.com/photo-1561043433-aaf687c4cf04?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1561043433-aaf687c4cf04?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            height: size.height * 0.3,
            child: CarouselSlider.builder(
              itemCount: banners.length,
              itemBuilder: (context, index, realIndex) {
                final banner = banners[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 5.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            banner,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 100.sp,
                          width: 240.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.9),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.sp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Diet Ideas on a Holiday',
                                  style: AppTextStyles.s16w500black.copyWith(
                                      color: AppColors.loginFieldValueColor),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: AppColors.loginPageTitleColor,
                                    ),
                                    HorizontalSizedBox(width: 5.sp),
                                    Text(
                                      'Admin',
                                      style:
                                          AppTextStyles.s12w400black.copyWith(
                                        color: AppColors.loginFieldValueColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                  scrollDirection: Axis.horizontal,
                  scrollPhysics: banners.length == 1
                      ? const NeverScrollableScrollPhysics()
                      : const ScrollPhysics(),
                  autoPlay: banners.length == 1 ? false : true,
                  viewportFraction: 0.7),
            ),
          ),
        ),
        VerticalSizeBox(height: 20.sp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          child: const Text(
            'All Blogs',
            style: AppTextStyles.s22w600black,
          ),
        ),
        VerticalSizeBox(height: 20.sp),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: ListView.separated(
              itemCount: 10,
              physics: const BouncingScrollPhysics(),
              itemBuilder: ((context, index) {
                return Container(
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: AppColors.searchBoxBgColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.sp, vertical: 15.sp),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: SizedBox(
                              height: 90.sp,
                              width: 90.sp,
                              child: Image.network(
                                'https://images.unsplash.com/photo-1561043433-aaf687c4cf04?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          HorizontalSizedBox(width: 10.sp),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Diet Ideas on a Holiday in a western country'),
                                VerticalSizeBox(height: 10.sp),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: AppColors.loginPageTitleColor,
                                      size: 10,
                                    ),
                                    HorizontalSizedBox(width: 5.sp),
                                    Text(
                                      'Admin',
                                      style: AppTextStyles.s12w500chatPersonName
                                          .copyWith(
                                              color:
                                                  AppColors.loginPageBgColor),
                                    ),
                                    HorizontalSizedBox(width: 10.sp),
                                    SvgPicture.asset(
                                      AppImages.clockIcon,
                                      color: AppColors.loginPageTitleColor,
                                    ),
                                    HorizontalSizedBox(width: 5.sp),
                                    Text(
                                      '5 min',
                                      style: AppTextStyles.s12w500chatPersonName
                                          .copyWith(
                                              color:
                                                  AppColors.loginPageBgColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              separatorBuilder: (BuildContext context, int index) {
                return VerticalSizeBox(height: 10.sp);
              },
            ),
          ),
        ),
      ],
    );
  }
}
