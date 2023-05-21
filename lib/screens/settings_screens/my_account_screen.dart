import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/image_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  String? currentCountry;

  List<String> countries = ['India', 'Canada', 'Shrilanka'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: simpleAppBar(context, title: 'My Account'),
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.profileBackgroundColor,
                      maxRadius: 50.sp,
                      child: Image.asset(
                        AppImages.appBarProfileImage,
                        height: 70.sp,
                        width: 70.sp,
                      ),
                    ),
                    Container(
                      height: 40.sp,
                      width: 40.sp,
                      decoration: BoxDecoration(
                        color: AppColors.loginFieldValueColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: CircleAvatar(
                          maxRadius: 15,
                          backgroundColor: AppColors.loginPageBgColor,
                          child: SvgPicture.asset(
                            AppImages.editLine,
                            height: 15.sp,
                            width: 15.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                VerticalSizeBox(height: 15.sp),
                const Text(
                  'Samantha Ong',
                  style: AppTextStyles.s22w600black,
                ),
                Text(
                  'youremail@domain.com | +601 234 567 89',
                  style: AppTextStyles.s14w400cloginText
                      .copyWith(color: AppColors.blackColor),
                ),
                VerticalSizeBox(height: 15.sp),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: AppColors.searchBoxBgColor,
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10.sp, right: 10.sp, top: 5.sp, bottom: 10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Full name',
                          style: AppTextStyles.s10w400black,
                        ),
                        TextField(
                          expands: false,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.zero,
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalSizeBox(height: 10.sp),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: AppColors.searchBoxBgColor,
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10.sp, right: 10.sp, top: 5.sp, bottom: 10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Date of Birth',
                          style: AppTextStyles.s10w400black,
                        ),
                        TextField(
                          expands: false,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.zero,
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalSizeBox(height: 10.sp),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: AppColors.searchBoxBgColor,
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10.sp, right: 10.sp, top: 5.sp, bottom: 10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Email Address',
                          style: AppTextStyles.s10w400black,
                        ),
                        TextField(
                          expands: false,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.zero,
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalSizeBox(height: 10.sp),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: AppColors.searchBoxBgColor,
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10.sp, right: 10.sp, top: 5.sp, bottom: 10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Phone Number',
                          style: AppTextStyles.s10w400black,
                        ),
                        TextField(
                          expands: false,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.zero,
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalSizeBox(height: 10.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 60.sp,
                      width: 180.sp.sp,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: AppColors.searchBoxBgColor,
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10.sp, right: 10.sp, top: 5.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Country',
                                style: AppTextStyles.s10w400black,
                              ),
                              DropdownButtonFormField<String>(
                                value: currentCountry,
                                items: countries
                                    .map((item) => DropdownMenuItem<String>(
                                        value: item, child: Text(item)))
                                    .toList(),
                                onChanged: (value) => setState(
                                  () {
                                    value != null
                                        ? currentCountry = value
                                        : null;
                                  },
                                ),
                                iconSize: 30,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.darkGreyColor,
                                ),
                                decoration: const InputDecoration(
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60.sp,
                      width: 180.sp.sp,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: AppColors.searchBoxBgColor,
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10.sp, right: 10.sp, top: 5.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Gender',
                                style: AppTextStyles.s10w400black,
                              ),
                              DropdownButtonFormField<String>(
                                value: currentCountry,
                                items: countries
                                    .map((item) => DropdownMenuItem<String>(
                                        value: item, child: Text(item)))
                                    .toList(),
                                onChanged: (value) => setState(
                                  () {
                                    value != null
                                        ? currentCountry = value
                                        : null;
                                  },
                                ),
                                iconSize: 30,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.darkGreyColor,
                                ),
                                decoration: const InputDecoration(
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                VerticalSizeBox(height: 10.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 60.sp,
                      width: 180.sp.sp,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: AppColors.searchBoxBgColor,
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10.sp, right: 10.sp, top: 5.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Weight (kg)',
                                style: AppTextStyles.s10w400black,
                              ),
                              TextField(
                                expands: false,
                                decoration: InputDecoration(
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60.sp,
                      width: 180.sp.sp,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: AppColors.searchBoxBgColor,
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10.sp, right: 10.sp, top: 5.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Height (cm)',
                                style: AppTextStyles.s10w400black,
                              ),
                              TextField(
                                expands: false,
                                decoration: InputDecoration(
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                VerticalSizeBox(height: 15.sp),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: AppColors.searchBoxBgColor,
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10.sp, right: 10.sp, top: 5.sp, bottom: 10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Address',
                          style: AppTextStyles.s10w400black,
                        ),
                        TextField(
                          expands: false,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.zero,
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalSizeBox(height: 10.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                        height: 40.sp,
                        width: 150.sp,
                        buttonTitle: 'Update',
                        buttonColor: AppColors.loginPageBgColor,
                        onTap: () {}),
                    CustomButton(
                        height: 40.sp,
                        width: 150.sp,
                        buttonTitle: 'Cancel',
                        buttonColor: Colors.red,
                        onTap: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
