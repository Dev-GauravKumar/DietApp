import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/route/routes.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: _size.height * 0.08, horizontal: _size.width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Conversations',
              style: AppTextStyles.s17w700cblack.copyWith(fontSize: 22),
            ),
            VerticalSizeBox(height: 20.sp),
            searchBox(),
            VerticalSizeBox(height: 20.sp),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteGenerator.chatBoxScreen,
                          arguments: 'Dr Jane Doe');
                    },
                    child: MessageTile(
                      name: 'Dr Jane Doe',
                      message: 'That’s great, I look forward to hearing ba...',
                      time: '11:20 am',
                      isMessageSeen: index % 2 == 0 ? true : false,
                      messageCount: index % 2 == 0 ? null : 2,
                      isMessageSent: index % 3 == 0 ? true : false,
                      isGroup: index % 4 == 0 ? true : false,
                      lastPersonName: 'Thecla',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      height: 40.sp,
      decoration: BoxDecoration(
          color: AppColors.searchBoxBgColor,
          borderRadius: BorderRadius.circular(5)),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none),
      ),
    );
  }
}
