import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final titles = [
    'New Update',
    'You have a new Message',
    'Expired Service Program'
  ];
  final subtitles = [
    'Your app has been successfully updated to version 1.2.2',
    'You have a new message from admin',
    'Your service program has expired on 30/03/22'
  ];
  final times = ['09:32', '09:32', '04/09/22'];
  final isSeen = [false, false, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 20.sp),
        itemCount: titles.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: isSeen[index]
                ? Text(
                    titles[index],
                  )
                : UnSeenNotificationTitle(title: titles[index]),
            subtitle: Text(
              subtitles[index],
              style: AppTextStyles.s10w400black,
            ),
            trailing: Text(
              times[index],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            indent: 12,
            height: 0,
            thickness: 1,
            color: AppColors.loginPageBgColor,
          );
        },
      ),
    );
  }
}
