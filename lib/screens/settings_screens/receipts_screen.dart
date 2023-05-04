import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReceiptsScreen extends StatelessWidget {
  const ReceiptsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(context, title: 'Receipt'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'November 2022',
              style: AppTextStyles.s20w700black,
            ),
            VerticalSizeBox(height: 20.sp),
            const ReceiptCard(
              name: 'Service Programme 1',
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
              price: 'RM 200',
              receiptNumber: '456749687',
              date: '30/11/22',
            ),
            VerticalSizeBox(height: 20.sp),
            const Text(
              'October 2022',
              style: AppTextStyles.s20w700black,
            ),
            VerticalSizeBox(height: 20.sp),
            const ReceiptCard(
              name: 'Service Programme 3',
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
              price: 'RM 200',
              receiptNumber: '456749687',
              date: '30/11/22',
            ),
            VerticalSizeBox(height: 20.sp),
            const ReceiptCard(
              name: 'Service Programme 1',
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
              price: 'RM 200',
              receiptNumber: '456749687',
              date: '30/11/22',
            ),
          ],
        ),
      ),
    );
  }
}
