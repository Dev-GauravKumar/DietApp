import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/image_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/route/routes.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: _size.height * 0.08, horizontal: _size.width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: AppTextStyles.s17w700cblack.copyWith(fontSize: 22),
            ),
            VerticalSizeBox(height: 20.sp),
            const ProfileCard(
              title: 'Samantha Ong Jia Wen',
              registrationDate: '01/01/22',
            ),
            VerticalSizeBox(height: 10.sp),
            Card(
              elevation: 5.0,
              color: AppColors.searchBoxBgColor,
              child: Padding(
                padding: EdgeInsets.only(bottom: 12.sp),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.myAccountScreen);
                      },
                      leading: CircleAvatar(
                        backgroundColor: AppColors.loginPageBgColor,
                        child: SvgPicture.asset(AppImages.myAccountImage),
                      ),
                      title: const Text(
                        'My Account',
                        style: AppTextStyles.s13w500black,
                      ),
                      subtitle: Text(
                        'Make changes to your account',
                        style: AppTextStyles.s11w400grey
                            .copyWith(color: AppColors.blackColor),
                      ),
                      trailing: SizedBox(
                        width: 45.sp,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.warning,
                              size: 20,
                              color: Colors.red,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                              color: AppColors.loginPageBgColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.serviceProgrammeScreen);
                      },
                      leading: CircleAvatar(
                        backgroundColor: AppColors.loginPageBgColor,
                        child: SvgPicture.asset(AppImages.serviceImage),
                      ),
                      title: const Text(
                        'Service Programme & Continuation',
                        style: AppTextStyles.s13w500black,
                      ),
                      subtitle: Text(
                        'Manage your programme',
                        style: AppTextStyles.s11w400grey
                            .copyWith(color: AppColors.blackColor),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                        color: AppColors.loginPageBgColor,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.receiptsScreen);
                      },
                      leading: CircleAvatar(
                        backgroundColor: AppColors.loginPageBgColor,
                        child: SvgPicture.asset(AppImages.receiptImage),
                      ),
                      title: const Text(
                        'Receipts',
                        style: AppTextStyles.s13w500black,
                      ),
                      subtitle: Text(
                        'Manage your payment receipts',
                        style: AppTextStyles.s11w400grey
                            .copyWith(color: AppColors.blackColor),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                        color: AppColors.loginPageBgColor,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.dietitianBioScreen);
                      },
                      leading: CircleAvatar(
                        backgroundColor: AppColors.loginPageBgColor,
                        child: SvgPicture.asset(AppImages.dietitianImage),
                      ),
                      title: const Text(
                        'Dietitian Biodata',
                        style: AppTextStyles.s13w500black,
                      ),
                      subtitle: Text(
                        'Get to know your dietitian',
                        style: AppTextStyles.s11w400grey
                            .copyWith(color: AppColors.blackColor),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                        color: AppColors.loginPageBgColor,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, RouteGenerator.loginPage);
                      },
                      leading: CircleAvatar(
                        backgroundColor: AppColors.loginPageBgColor,
                        child: SvgPicture.asset(AppImages.logoutImage),
                      ),
                      title: const Text(
                        'Log out',
                        style: AppTextStyles.s13w500black,
                      ),
                      subtitle: Text(
                        'Further secure your account for safety',
                        style: AppTextStyles.s11w400grey
                            .copyWith(color: AppColors.blackColor),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                        color: AppColors.loginPageBgColor,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
