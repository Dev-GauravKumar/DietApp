import 'package:diet_app/constants/color_consts.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RecieveMessageBox(
                  message:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'),
              VerticalSizeBox(height: 10.sp),
              const SendMessageBox(
                  message:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'),
              VerticalSizeBox(height: 10.sp),
              const FileChatBox(
                fileName: 'Meal Plan.pdf',
                fileSize: '487 KB',
              ),
              VerticalSizeBox(height: 10.sp),
              const RecieveMessageBox(
                  message:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'),
              VerticalSizeBox(height: 10.sp),
              const SendMessageBox(
                  message:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'),
              VerticalSizeBox(height: 10.sp),
              const FileChatBox(
                fileName: 'Meal Plan.pdf',
                fileSize: '487 KB',
              ),
              VerticalSizeBox(height: 20.sp),
              const Divider(),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Lorem ipsum dolor sit',
                  prefixIcon: Icon(
                    Icons.add,
                    color: AppColors.loginPageBgColor,
                  ),
                  suffixIcon: Icon(
                    Icons.send,
                    color: AppColors.loginPageBgColor,
                  ),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
