import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBoxScreen extends StatefulWidget {
  const ChatBoxScreen({super.key, required this.name});
  final String name;

  @override
  State<ChatBoxScreen> createState() => _ChatBoxScreenState();
}

class _ChatBoxScreenState extends State<ChatBoxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(context, title: widget.name),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: ((context, index) {
            return MessageBox(
                message:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt');
          }),
          separatorBuilder: (BuildContext context, int index) {
            return VerticalSizeBox(height: 15.sp);
          },
        ),
      ),
    );
  }
}
