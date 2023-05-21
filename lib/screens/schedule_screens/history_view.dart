import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _size.height * 0.025),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 0),
        physics: const BouncingScrollPhysics(),
        itemCount: 2,
        itemBuilder: ((context, index) {
          return const DetailScheduleCard(
              date: '31 Dec, 22',
              time: '10 : 00 am',
              name: 'Dr. John Doe',
              serviceName: 'Service Program 2',
              showReschedule: false);
        }),
        separatorBuilder: (BuildContext context, int index) {
          return VerticalSizeBox(height: 10.sp);
        },
      ),
    );
  }
}
