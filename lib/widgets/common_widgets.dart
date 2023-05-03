import 'dart:math';
import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/image_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/route/routes.dart';
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
    return SizedBox(
      height: 100.sp,
      width: 120.sp,
      child: Card(
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
              Text(
                title,
                style: AppTextStyles.s12w500cloginFieldHeader
                    .copyWith(color: textColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UnSeenNotificationTitle extends StatelessWidget {
  const UnSeenNotificationTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.s16w500black,
        ),
        const Icon(
          Icons.circle,
          color: Colors.red,
          size: 6,
        )
      ],
    );
  }
}

class TrackerProgressCard extends StatelessWidget {
  const TrackerProgressCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onTap,
      required this.onEditTap,
      required this.cardColor,
      required this.titleColor,
      required this.subtitleColor});
  final String title;
  final String subtitle;
  final GestureTapCallback onTap;
  final GestureTapCallback onEditTap;
  final Color cardColor;
  final Color titleColor;
  final Color subtitleColor;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 20.sp),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: _size.height * 0.13,
          child: Card(
            color: cardColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: EdgeInsets.all(10.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          const CircularProgressIndicator(
                            value: 0.65,
                            color: AppColors.loginPageTitleColor,
                          ),
                          Text(
                            '65%',
                            style: AppTextStyles.s14w500cloginFieldValue
                                .copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                      HorizontalSizedBox(width: 15.sp),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: AppTextStyles.s14w500cloginFieldValue,
                          ),
                          VerticalSizeBox(height: 5.sp),
                          Text(
                            subtitle,
                            style: AppTextStyles.s12w700black
                                .copyWith(color: subtitleColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: onEditTap,
                      icon: const Icon(
                        Icons.edit,
                        color: AppColors.loginFieldValueColor,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  const MessageTile(
      {super.key,
      required this.name,
      required this.message,
      required this.time,
      this.messageCount,
      required this.isMessageSeen,
      required this.isMessageSent,
      required this.isGroup,
      required this.lastPersonName});
  final String name;
  final String message;
  final String time;
  final int? messageCount;
  final bool isMessageSeen;
  final bool isMessageSent;
  final bool isGroup;
  final String lastPersonName;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return ListTile(
      leading: Stack(
        alignment: Alignment.topRight,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
                height: 40.sp,
                width: 40.sp,
                color: AppColors.profileBackgroundColor,
                child: Image.asset(
                  AppImages.appBarProfileImage,
                  fit: BoxFit.contain,
                )),
          ),
          isMessageSeen
              ? const SizedBox()
              : Container(
                  height: 10.sp,
                  width: 10.sp,
                  decoration: BoxDecoration(
                      color: AppColors.loginFieldValueColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 3,
                    ),
                  ),
                ),
        ],
      ),
      title: Text(
        name,
        style: AppTextStyles.s14w500cloginFieldValue
            .copyWith(color: AppColors.blackColor),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: isGroup
          ? RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: '$lastPersonName : ',
                      style: AppTextStyles.s12w500chatPersonName),
                  TextSpan(
                    text: message,
                    style: AppTextStyles.s11w500chatMessageColor,
                  ),
                ],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          : Text(
              message,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.s11w500chatMessageColor,
            ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: AppTextStyles.s10w400chatTimeColor,
          ),
          messageCount != null && isMessageSeen == false
              ? Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CircleAvatar(
                    backgroundColor: AppColors.searchBoxBgColor,
                    radius: 10.0,
                    child: Text(
                      messageCount.toString(),
                      style: const TextStyle(
                          color: AppColors.loginPageBgColor, fontSize: 10.0),
                    ),
                  ),
                )
              : isMessageSent
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Icon(
                        Icons.check,
                        color: AppColors.loginPageBgColor,
                        size: 15.sp,
                      ),
                    )
                  : const SizedBox(),
        ],
      ),
    );
  }
}

AppBar simpleAppBar(BuildContext context, {required String title}) {
  final size = MediaQuery.of(context).size;
  return AppBar(
    elevation: 0,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: AppColors.blackColor,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: Text(
      title,
      style: AppTextStyles.s20w700black,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
    centerTitle: true,
    bottom: PreferredSize(
        preferredSize: Size(size.width, 5.sp), child: const Divider()),
  );
}

class MessageBox extends StatelessWidget {
  const MessageBox({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.zero,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 15.sp),
        child: Text(message),
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  const SessionCard(
      {super.key,
      required this.date,
      required this.completedSession,
      required this.totalSession});
  final String date;
  final int completedSession;
  final int totalSession;
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SizedBox(
      width: _size.width,
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: AppColors.loginPageBgColor,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Cutt-off date',
                style: AppTextStyles.s14w500cloginFieldValue.copyWith(
                  color: AppColors.darkGreyColor,
                ),
              ),
              VerticalSizeBox(height: 10.sp),
              Text(
                date,
                style: AppTextStyles.s24w700white,
              ),
              VerticalSizeBox(height: 20.sp),
              Text(
                'completed: $completedSession / $totalSession Sessions',
                style: AppTextStyles.s10w700newAppointment,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScheduleCard extends StatelessWidget {
  const DetailScheduleCard(
      {super.key,
      required this.date,
      required this.time,
      required this.name,
      required this.serviceName,
      required this.showReschedule});
  final String date;
  final String time;
  final String name;
  final String serviceName;
  final bool showReschedule;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SizedBox(
      width: _size.width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: AppColors.searchBoxBgColor,
        elevation: 10.0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 20.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date',
                        style: AppTextStyles.s11w500chatMessageColor
                            .copyWith(color: AppColors.blackColor),
                      ),
                      Text(
                        date,
                        style: AppTextStyles.s16w500black,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Time',
                        style: AppTextStyles.s11w500chatMessageColor
                            .copyWith(color: AppColors.blackColor),
                      ),
                      Text(
                        time,
                        style: AppTextStyles.s16w500black,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dietitian/Nutritionist',
                        style: AppTextStyles.s11w500chatMessageColor
                            .copyWith(color: AppColors.blackColor),
                      ),
                      Text(
                        name,
                        style: AppTextStyles.s16w500black,
                      ),
                    ],
                  ),
                ],
              ),
              VerticalSizeBox(height: 20.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Service Name',
                        style: AppTextStyles.s11w500chatMessageColor
                            .copyWith(color: AppColors.blackColor),
                      ),
                      Text(
                        serviceName,
                        style: AppTextStyles.s16w500black,
                      ),
                    ],
                  ),
                  showReschedule
                      ? CustomButton(
                          height: 40.sp,
                          width: 150.sp,
                          buttonTitle: 'Reschedule',
                          buttonColor: AppColors.loginPageBgColor,
                          onTap: () {})
                      : const SizedBox(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.height,
      required this.width,
      required this.buttonTitle,
      required this.buttonColor,
      required this.onTap});
  final double height;
  final double width;
  final String buttonTitle;
  final Color buttonColor;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          primary: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: Text(buttonTitle, style: AppTextStyles.s18w500white),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key, required this.title, required this.registrationDate});
  final String title;
  final String registrationDate;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SizedBox(
      height: _size.height * 0.14,
      child: Card(
        elevation: 5.0,
        color: AppColors.searchBoxBgColor,
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.sp, horizontal: 20.sp),
          leading: Container(
            height: 60.sp,
            width: 60.sp,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.loginFieldValueColor),
            child: Center(
              child: CircleAvatar(
                maxRadius: 25,
                backgroundColor: AppColors.profileBackgroundColor,
                child: Image.asset(
                  AppImages.appBarProfileImage,
                  fit: BoxFit.contain,
                  height: 35.sp,
                  width: 35.sp,
                ),
              ),
            ),
          ),
          title: Text(
            title,
            style: AppTextStyles.s14w700black,
          ),
          subtitle: Text(
            'Registered on : $registrationDate',
            style: AppTextStyles.s11w400grey,
          ),
        ),
      ),
    );
  }
}
