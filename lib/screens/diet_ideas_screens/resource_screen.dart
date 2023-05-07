import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResourceScreen extends StatelessWidget {
  const ResourceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
      child: ListView.separated(
        itemBuilder: ((context, index) {
          return const ResourceCard();
        }),
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) {
          return VerticalSizeBox(height: 20.sp);
        },
      ),
    );
  }
}
