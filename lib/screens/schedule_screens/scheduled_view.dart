import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduledView extends StatelessWidget {
  const ScheduledView({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _size.height * 0.025),
      child: Column(
        children: [
          const SessionCard(
              date: 'Dec 20, 2022', completedSession: 1, totalSession: 4),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 15.sp),
              physics: const BouncingScrollPhysics(),
              itemCount: 2,
              itemBuilder: ((context, index) {
                return index == 1
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const DetailScheduleCard(
                              date: '31 Dec, 22',
                              time: '10 : 00 am',
                              name: 'Dr. John Doe',
                              serviceName: 'Service Program 2',
                              showReschedule: true),
                          VerticalSizeBox(height: 10.sp),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 5.0,
                                primary: AppColors.newAppointmentColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text('NEW APPOINTMENT')),
                        ],
                      )
                    : const DetailScheduleCard(
                        date: '31 Dec, 22',
                        time: '10 : 00 am',
                        name: 'Dr. John Doe',
                        serviceName: 'Service Program 2',
                        showReschedule: true);
              }),
              separatorBuilder: (BuildContext context, int index) {
                return VerticalSizeBox(height: 10.sp);
              },
            ),
          ),
        ],
      ),
    );
  }
}
