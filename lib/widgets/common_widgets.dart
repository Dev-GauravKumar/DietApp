import 'dart:math';
import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/image_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/constants/widgets_consts.dart';
import 'package:diet_app/route/routes.dart';
import 'package:fl_chart/fl_chart.dart';
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
      height: 55.sp,
      width: width ?? 316.sp,
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
                          onTap: () {
                            Navigator.pushNamed(context,
                                RouteGenerator.appointmentBookingScreen);
                          })
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

class ServiceProgrammeTopCard extends StatelessWidget {
  const ServiceProgrammeTopCard({
    super.key,
    required this.date,
    required this.cutOffDate,
  });
  final String date;
  final String cutOffDate;
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SizedBox(
      width: _size.width,
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: AppColors.loginPageBgColor,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                date,
                style: AppTextStyles.s24w700white,
              ),
              VerticalSizeBox(height: 20.sp),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Cutt-off date ',
                      style: AppTextStyles.s14w500cloginFieldValue
                          .copyWith(color: AppColors.darkGreyColor),
                    ),
                    TextSpan(
                      text: cutOffDate,
                      style: AppTextStyles.s14w700black
                          .copyWith(color: AppColors.loginFieldValueColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceProgrammeDetailCard extends StatelessWidget {
  const ServiceProgrammeDetailCard(
      {super.key,
      required this.name,
      required this.description,
      required this.price,
      required this.isActive});
  final String name;
  final String description;
  final String price;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isActive ? 5.0 : 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: isActive ? AppColors.trackerIconColor : AppColors.searchBoxBgColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTextStyles.s16w500black.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isActive
                      ? AppColors.loginFieldValueColor
                      : AppColors.blackColor),
            ),
            VerticalSizeBox(height: 10.sp),
            Text(
              description,
              style: AppTextStyles.s14w400cloginText.copyWith(
                  color: isActive
                      ? AppColors.loginFieldValueColor
                      : AppColors.darkGreyColor),
            ),
            VerticalSizeBox(height: 10.sp),
            Align(
              alignment: Alignment.centerRight,
              child: RichText(
                text: TextSpan(
                  style: AppTextStyles.s20w700black.copyWith(
                      color: isActive
                          ? AppColors.loginFieldValueColor
                          : AppColors.blackColor),
                  children: [
                    TextSpan(
                      text: price,
                    ),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: const Offset(0.0, -7.0),
                        child: Text(
                          '.00',
                          style: AppTextStyles.s20w700black.copyWith(
                              fontSize: 11,
                              color: isActive
                                  ? AppColors.loginFieldValueColor
                                  : AppColors.blackColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReceiptCard extends StatelessWidget {
  const ReceiptCard(
      {super.key,
      required this.name,
      required this.description,
      required this.price,
      required this.receiptNumber,
      required this.date});
  final String name;
  final String description;
  final String price;
  final String receiptNumber;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: AppColors.searchBoxBgColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: AppTextStyles.s16w500black
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  'Receipt Num : $receiptNumber',
                  style: AppTextStyles.s12w400black,
                ),
              ],
            ),
            VerticalSizeBox(height: 10.sp),
            Text(
              description,
              style: AppTextStyles.s14w400cloginText
                  .copyWith(color: AppColors.darkGreyColor),
            ),
            VerticalSizeBox(height: 10.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(date),
                RichText(
                  text: TextSpan(
                    style: AppTextStyles.s20w700black,
                    children: [
                      TextSpan(
                        text: price,
                      ),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0.0, -7.0),
                          child: Text(
                            '.00',
                            style: AppTextStyles.s20w700black.copyWith(
                                fontSize: 11, color: AppColors.blackColor),
                          ),
                        ),
                      )
                    ],
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

class RedProgressCard extends StatelessWidget {
  const RedProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkRedColor,
        borderRadius: BorderRadius.circular(25),
      ),
      height: 80.sp,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 20.sp),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: 0,
                  backgroundColor:
                      AppColors.loginFieldValueColor.withOpacity(0.7),
                ),
                Text(
                  '0%',
                  style: AppTextStyles.s12w700black
                      .copyWith(color: AppColors.loginFieldValueColor),
                ),
              ],
            ),
            HorizontalSizedBox(width: 15.sp),
            Expanded(
              child: Text(
                'Oops! It looks like you have not registered for a service programme!',
                style: AppTextStyles.s12w700black
                    .copyWith(color: AppColors.loginFieldValueColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlueProgressCard extends StatelessWidget {
  const BlueProgressCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onTap,
      required this.onEditTap,
      required this.cardColor,
      required this.titleColor,
      required this.subtitleColor,
      required this.progressValue,
      required this.progressValueColor,
      required this.progressBgColor});

  final String title;
  final String subtitle;
  final double progressValue;
  final GestureTapCallback onTap;
  final GestureTapCallback onEditTap;
  final Color cardColor;
  final Color titleColor;
  final Color subtitleColor;
  final Color progressValueColor;
  final Color progressBgColor;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: _size.height * 0.13,
        child: Card(
          color: cardColor,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: progressValue / 100,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(progressValueColor),
                          backgroundColor: progressBgColor.withOpacity(0.3),
                        ),
                        Text(
                          '${progressValue.toInt()}%',
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
                          style: AppTextStyles.s12w500chatPersonName.copyWith(
                            color: titleColor,
                          ),
                        ),
                        VerticalSizeBox(height: 5.sp),
                        Text(
                          subtitle,
                          style: AppTextStyles.s16w700black
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CalorieIntakeCard extends StatelessWidget {
  const CalorieIntakeCard(
      {super.key,
      required this.progressValue,
      required this.todayAllowance,
      required this.remainingAllowance});
  final double progressValue;
  final int todayAllowance;
  final int remainingAllowance;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: AppColors.loginPageTitleColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Calorie Intake',
              style: AppTextStyles.s16w700black.copyWith(
                color: AppColors.loginFieldValueColor,
              ),
            ),
            VerticalSizeBox(height: 20.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.sp),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 120.sp,
                        width: 120.sp,
                        child: CircularProgressIndicator(
                          value: progressValue / 100,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            progressValue < 100
                                ? AppColors.trackerIconColor
                                : AppColors.darkRedColor,
                          ),
                          strokeWidth: 15.0,
                          backgroundColor:
                              AppColors.loginFieldValueColor.withOpacity(0.3),
                        ),
                      ),
                      Column(
                        children: [
                          const Text(
                            'Progress',
                            style: AppTextStyles.s10w500white,
                          ),
                          Text(
                            '${progressValue.toInt()}%',
                            style: AppTextStyles.s40w700trackerIcon,
                          ),
                          const Text(
                            '500 / 1200kcal',
                            style: AppTextStyles.s8w500white,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Today’s Allowance',
                        style: AppTextStyles.s12w500chatPersonName.copyWith(
                          color: AppColors.loginFieldValueColor,
                        ),
                      ),
                      VerticalSizeBox(height: 10.sp),
                      Text(
                        '$todayAllowance kcal',
                        style: AppTextStyles.s32w700loginBg,
                      ),
                      VerticalSizeBox(height: 20.sp),
                      Text(
                        'Remaining Allowance',
                        style: AppTextStyles.s12w500chatPersonName.copyWith(
                          color: AppColors.loginFieldValueColor,
                        ),
                      ),
                      VerticalSizeBox(height: 10.sp),
                      Text(
                        '$remainingAllowance kcal',
                        style: AppTextStyles.s32w700loginBg,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeightTrackerCard extends StatelessWidget {
  const WeightTrackerCard(
      {super.key,
      required this.goalWeight,
      required this.currentWeight,
      required this.goalProgressColor,
      required this.currentProgressColor,
      required this.weightLeft,
      required this.currentPercent});
  final double goalWeight;
  final double currentWeight;
  final int weightLeft;
  final int currentPercent;
  final Color goalProgressColor;
  final Color currentProgressColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: AppColors.lightPinkColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 20.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: '${goalWeight.toInt()}',
                          style: AppTextStyles.s24w700white),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0.0, 4.0),
                          child: Text(
                            'kg',
                            style: AppTextStyles.s12w500chatPersonName.copyWith(
                              color: AppColors.loginFieldValueColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                VerticalSizeBox(height: 5.sp),
                SizedBox(
                  width: 120.sp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Goal Weight',
                        style: AppTextStyles.s12w700black
                            .copyWith(color: AppColors.loginPageBgColor),
                      ),
                      Text(
                        '$weightLeft' 'w left',
                        style: AppTextStyles.s12w500cloginFieldHeader
                            .copyWith(color: AppColors.loginPageBgColor),
                      ),
                    ],
                  ),
                ),
                VerticalSizeBox(height: 10.sp),
                SizedBox(
                  width: 120.sp,
                  child: LinearProgressIndicator(
                    value: goalWeight / 100,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      goalProgressColor,
                    ),
                    backgroundColor: goalProgressColor.withOpacity(0.2),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: '${currentWeight.toInt()}',
                          style: AppTextStyles.s24w700white),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0.0, 4.0),
                          child: Text(
                            'kg',
                            style: AppTextStyles.s12w500chatPersonName.copyWith(
                              color: AppColors.loginFieldValueColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                VerticalSizeBox(height: 5.sp),
                SizedBox(
                  width: 120.sp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Current weight',
                        style: AppTextStyles.s12w700black
                            .copyWith(color: AppColors.loginPageBgColor),
                      ),
                      Text(
                        '$currentPercent%',
                        style: AppTextStyles.s12w500cloginFieldHeader
                            .copyWith(color: AppColors.loginPageBgColor),
                      ),
                    ],
                  ),
                ),
                VerticalSizeBox(height: 10.sp),
                SizedBox(
                  width: 120.sp,
                  child: LinearProgressIndicator(
                    value: currentWeight / 100,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      currentProgressColor,
                    ),
                    backgroundColor: currentProgressColor.withOpacity(0.2),
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

class ChartCard1 extends StatefulWidget {
  const ChartCard1({
    super.key,
    required this.values,
  });
  final List<double> values;

  @override
  State<ChartCard1> createState() => _ChartCard1State();
}

class _ChartCard1State extends State<ChartCard1> {
  final List<String> names = ['Carbs', 'Protein', 'Fats'];

  String? currentValue = '31 Dec 2022';
  List<String> dropDownValues = ['31 Dec 2022', '30 Dec 2022', '29 Dec 2022'];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: AppColors.trackerIconColor,
      child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Macronutrients',
                  style: AppTextStyles.s16w700black.copyWith(
                    color: AppColors.loginFieldValueColor,
                  ),
                ),
                SizedBox(
                  width: 126.sp,
                  height: 35.sp,
                  child: DropdownButtonFormField<String>(
                    value: currentValue,
                    items: dropDownValues
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item,
                                style: AppTextStyles.s14w500cloginFieldValue),
                          ),
                        )
                        .toList(),
                    onChanged: (value) => setState(
                      () {
                        value != null ? currentValue = value : null;
                      },
                    ),
                    iconSize: 18,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.loginFieldValueColor,
                    ),
                    dropdownColor: AppColors.loginPageBgColor,
                    style: AppTextStyles.s14w500cloginFieldValue,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.loginPageBgColor,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AspectRatio(
                aspectRatio: 1.6,
                child: BarChart(
                  BarChartData(
                      barGroups: [
                        for (int i = 0; i < 3; i++) ...<BarChartGroupData>{
                          BarChartGroupData(
                            x: i,
                            barRods: [
                              BarChartRodData(
                                  toY: widget.values[i],
                                  color: AppColors.loginPageTitleColor,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  )),
                            ],
                          ),
                        },
                      ],
                      borderData: FlBorderData(
                          show: true,
                          border: const Border(
                            left: BorderSide.none,
                            right: BorderSide.none,
                            top: BorderSide.none,
                            bottom: BorderSide(
                              width: 0.5,
                              color: AppColors.loginFieldValueColor,
                            ),
                          )),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            reservedSize: 20,
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: DefaultTextStyle(
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.s12w400black.copyWith(
                                    color: AppColors.loginFieldValueColor,
                                  ),
                                  child: Text(
                                    names[value.toInt()],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            interval: 5,
                            reservedSize: 30,
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              if (value == meta.max) {
                                return const SizedBox();
                              }
                              final stringValue = value.toInt().toString();
                              return DefaultTextStyle(
                                  style: AppTextStyles.s12w400black.copyWith(
                                    color: AppColors.loginFieldValueColor,
                                  ),
                                  child: Text(stringValue.toString()));
                            },
                          ),
                        ),
                      ),
                      gridData: FlGridData(
                        horizontalInterval: 5,
                        show: true,
                        drawVerticalLine: false,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            strokeWidth: 0.5,
                            dashArray: [5],
                            color: AppColors.loginFieldValueColor,
                          );
                        },
                      ),
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogCard extends StatelessWidget {
  const BlogCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: AppColors.searchBoxBgColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 15.sp),
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
                children: [
                  Text('Diet Ideas on a Holiday in a western country'),
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
                            .copyWith(color: AppColors.loginPageBgColor),
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
                            .copyWith(color: AppColors.loginPageBgColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResourceCard extends StatelessWidget {
  const ResourceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.searchBoxBgColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Resource 2',
                  style: AppTextStyles.s22w600black,
                ),
                Text(
                  '15-Dec-2022    10:27AM',
                  style: AppTextStyles.s10w400black
                      .copyWith(color: AppColors.darkGreyColor),
                ),
              ],
            ),
            VerticalSizeBox(height: 15.sp),
            Text(
              "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
              style: AppTextStyles.s12w400black
                  .copyWith(wordSpacing: 5, height: 2),
            ),
            VerticalSizeBox(height: 15.sp),
            RichText(
                text: TextSpan(
              children: [
                TextSpan(
                    text: 'Resource link : ',
                    style: AppTextStyles.s12w500chatPersonName.copyWith(
                      color: AppColors.blackColor,
                    )),
                TextSpan(
                    text: 'www.googledrive.com',
                    style: AppTextStyles.s12w500chatPersonName.copyWith(
                      color: AppColors.loginPageBgColor,
                    )),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

class RatingsCard extends StatelessWidget {
  const RatingsCard(
      {super.key,
      required this.name,
      required this.review,
      required this.ratings,
      required this.profileImage,
      required this.cardColor,
      required this.deviderColor});
  final String name;
  final String review;
  final int ratings;
  final String profileImage;
  final Color cardColor;
  final Color deviderColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 15.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HorizontalSizedBox(width: 10.sp),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review,
                    style: AppTextStyles.s14w400cloginText
                        .copyWith(color: AppColors.blackColor),
                  ),
                  VerticalSizeBox(height: 10.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i <= 5; i++)
                        i <= ratings
                            ? SvgPicture.asset(AppImages.filledStarImage)
                            : SvgPicture.asset(AppImages.notFilledStarImage),
                    ],
                  ),
                  VerticalSizeBox(height: 10.sp),
                  Text(
                    name,
                    style: AppTextStyles.s14w400cloginText
                        .copyWith(color: AppColors.blackColor),
                  ),
                ],
              ),
            ),
            HorizontalSizedBox(width: 20.sp),
            CircleAvatar(
              backgroundImage: NetworkImage(profileImage),
              radius: 35,
            ),
          ],
        ),
      ),
    );
  }
}
