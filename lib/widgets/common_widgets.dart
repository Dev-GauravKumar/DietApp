import 'dart:math';
import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/image_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerticalSizeBox extends StatelessWidget {
  const VerticalSizeBox({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class HorizontalSizedBox extends StatelessWidget {
  const HorizontalSizedBox({
    super.key,
    required this.width,
  });
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

class CommonButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String buttonTitle;
  final double? width;

  const CommonButton(
      {Key? key, required this.onTap, required this.buttonTitle, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return SizedBox(
      height: 55,
      width: width ?? 316,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 5,
          primary: AppColors.loginPageTitleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Text(buttonTitle, style: AppTextStyles.s16w600cloginBg),
      ),
    );
  }
}

class CompulsoryHeader extends StatelessWidget {
  const CompulsoryHeader({super.key, required this.header});
  final String header;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: header,
        style: AppTextStyles.s12w500cloginFieldHeader,
      ),
      TextSpan(
        text: '*',
        style:
            AppTextStyles.s12w500cloginFieldHeader.copyWith(color: Colors.red),
      ),
    ]));
  }
}

AppBar CommonAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.appBarBackgroundColor,
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            color: AppColors.profileBackgroundColor,
            child: Image.asset(
              AppImages.appBarProfileImage,
              fit: BoxFit.contain,
            )),
      ),
    ),
    leadingWidth: 60,
    toolbarHeight: 60,
    centerTitle: true,
    title: Column(
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
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: Card(
                elevation: 5.0,
                color: AppColors.loginFieldValueColor,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: SvgPicture.asset(
                    AppImages.appBarBellIcon,
                  ),
                ),
              ),
            ),
            Positioned(
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
    ],
  );
}

class HomeScreenCard extends StatelessWidget {
  const HomeScreenCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.color,
      required this.textColor});
  final String icon;
  final String title;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            VerticalSizeBox(height: 25.sp),
            Text(title,
                style: AppTextStyles.s12w500cloginFieldHeader
                    .copyWith(color: textColor)),
          ],
        ),
      ),
    );
  }
}
