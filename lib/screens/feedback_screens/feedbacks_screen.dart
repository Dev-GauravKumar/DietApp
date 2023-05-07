import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/route/routes.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedbacksScreen extends StatefulWidget {
  const FeedbacksScreen({super.key});

  @override
  State<FeedbacksScreen> createState() => _FeedbacksScreenState();
}

class _FeedbacksScreenState extends State<FeedbacksScreen> {
  final cardColors = [
    AppColors.searchBoxBgColor,
    AppColors.loginPageTitleColor,
    AppColors.yellowProgressColor,
    AppColors.lightPinkColor,
  ];
  final names = [
    'Issabelle Tan',
    'Jane Doe',
    'Samantha Lewis',
    'Siti Sarah',
  ];
  final ratings = [5, 4, 5, 3];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(10.sp),
        child: ListView.separated(
          itemBuilder: ((context, index) {
            return index == 3
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RatingsCard(
                        cardColor: cardColors[index],
                        name: names[index],
                        profileImage:
                            'https://s3-alpha-sig.figma.com/img/1f3e/521a/16a0a787ef912d202d16fd1494ddc65a?Expires=1684108800&Signature=hIKJemVt6wHMjIa5jFt5PiVswFcRMQNqi65KSK90Xo3uIFjOg2VKH7ZGWhJJEb2tCZt6AMSGXrpwSOAixasK0XxwjXbH8NsLZ7RK78LE6PTRdmixYI1LRX8n8PU4Sri~RpKOld1jkWJoy35OgHzykTbxVEudOo9cZKEbDCCzceGXcQni8Oqmxi60odqMhiBiX~DEJs4w7uau-vYlBltzcLlQBy8ygrUNdfLv5oGCauAiv4836KWRuP~61zSAoYnNx7B1oht-iOgsRkNFKQq8q6yc56rGqhFeZ84ylwOKxo7PjPJLnAmOqHGRy9MIXsdZgap99GSCm0QnOvLasJCYLw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                        ratings: ratings[index],
                        review:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed.',
                        deviderColor: AppColors.loginPageBgColor,
                      ),
                      VerticalSizeBox(height: 10.sp),
                      SizedBox(
                        height: 30.sp,
                        width: 170.sp,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouteGenerator.addFeedbackScreen);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 5.0,
                            primary: AppColors.loginPageTitleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: Text('NEW FEEDBACK',
                              style: AppTextStyles.s16w500black.copyWith(
                                  color: AppColors.loginFieldValueColor)),
                        ),
                      ),
                    ],
                  )
                : RatingsCard(
                    cardColor: cardColors[index],
                    name: names[index],
                    profileImage:
                        'https://s3-alpha-sig.figma.com/img/1f3e/521a/16a0a787ef912d202d16fd1494ddc65a?Expires=1684108800&Signature=hIKJemVt6wHMjIa5jFt5PiVswFcRMQNqi65KSK90Xo3uIFjOg2VKH7ZGWhJJEb2tCZt6AMSGXrpwSOAixasK0XxwjXbH8NsLZ7RK78LE6PTRdmixYI1LRX8n8PU4Sri~RpKOld1jkWJoy35OgHzykTbxVEudOo9cZKEbDCCzceGXcQni8Oqmxi60odqMhiBiX~DEJs4w7uau-vYlBltzcLlQBy8ygrUNdfLv5oGCauAiv4836KWRuP~61zSAoYnNx7B1oht-iOgsRkNFKQq8q6yc56rGqhFeZ84ylwOKxo7PjPJLnAmOqHGRy9MIXsdZgap99GSCm0QnOvLasJCYLw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                    ratings: ratings[index],
                    review:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed.',
                    deviderColor: AppColors.loginPageBgColor,
                  );
          }),
          itemCount: 4,
          separatorBuilder: (BuildContext context, int index) {
            return VerticalSizeBox(height: 10.sp);
          },
        ),
      ),
    );
  }
}
