import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/image_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddFeedbackScreen extends StatefulWidget {
  const AddFeedbackScreen({super.key});

  @override
  State<AddFeedbackScreen> createState() => _AddFeedbackScreenState();
}

class _AddFeedbackScreenState extends State<AddFeedbackScreen> {
  double experienceRatings = 0;
  double expertRatings = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(context, title: 'Feedback'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rate Your Experience ',
                style: AppTextStyles.s20w700black,
              ),
              VerticalSizeBox(height: 5.sp),
              Text(
                'Are you Satisfied with the Service?',
                style: AppTextStyles.s12w500chatPersonName
                    .copyWith(color: AppColors.blackColor),
              ),
              VerticalSizeBox(height: 20.sp),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                unratedColor: AppColors.trackerIconColor,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, index) => index < experienceRatings
                    ? SvgPicture.asset(AppImages.filledStarImage)
                    : SvgPicture.asset(AppImages.notFilledStarImage),
                onRatingUpdate: (rating) {
                  setState(() {
                    experienceRatings = rating;
                  });
                },
              ),
              VerticalSizeBox(height: 20.sp),
              Divider(),
              VerticalSizeBox(height: 10.sp),
              Text(
                'Tell us what can be improved?',
                style: AppTextStyles.s14w500cloginFieldValue
                    .copyWith(color: AppColors.blackColor),
              ),
              VerticalSizeBox(height: 10.sp),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.loginPageTitleColor),
                    child: Padding(
                      padding: EdgeInsets.all(
                        10.sp,
                      ),
                      child: Text(
                        'Lorem Ipsum',
                        style: AppTextStyles.s12w700black
                            .copyWith(color: AppColors.loginFieldValueColor),
                      ),
                    ),
                  ),
                  HorizontalSizedBox(width: 15.sp),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.loginPageTitleColor),
                    child: Padding(
                      padding: EdgeInsets.all(
                        10.sp,
                      ),
                      child: Text(
                        'Lorem Ipsum dolor sit',
                        style: AppTextStyles.s12w700black
                            .copyWith(color: AppColors.loginFieldValueColor),
                      ),
                    ),
                  ),
                ],
              ),
              VerticalSizeBox(height: 10.sp),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.loginPageTitleColor),
                    child: Padding(
                      padding: EdgeInsets.all(
                        10.sp,
                      ),
                      child: Text(
                        'Lorem Ipsum dolor sit amet',
                        style: AppTextStyles.s12w700black
                            .copyWith(color: AppColors.loginFieldValueColor),
                      ),
                    ),
                  ),
                  HorizontalSizedBox(width: 15.sp),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.loginPageTitleColor),
                    child: Padding(
                      padding: EdgeInsets.all(
                        10.sp,
                      ),
                      child: Text(
                        'Lorem Ipsum dolor sit',
                        style: AppTextStyles.s12w700black
                            .copyWith(color: AppColors.loginFieldValueColor),
                      ),
                    ),
                  ),
                ],
              ),
              VerticalSizeBox(height: 10.sp),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.loginPageTitleColor),
                    child: Padding(
                      padding: EdgeInsets.all(
                        10.sp,
                      ),
                      child: Text(
                        'Lorem Ipsum',
                        style: AppTextStyles.s12w700black
                            .copyWith(color: AppColors.loginFieldValueColor),
                      ),
                    ),
                  ),
                  HorizontalSizedBox(width: 15.sp),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.loginPageTitleColor),
                    child: Padding(
                      padding: EdgeInsets.all(
                        10.sp,
                      ),
                      child: Text(
                        'Lorem Ipsum',
                        style: AppTextStyles.s12w700black
                            .copyWith(color: AppColors.loginFieldValueColor),
                      ),
                    ),
                  ),
                ],
              ),
              VerticalSizeBox(height: 20.sp),
              Divider(),
              VerticalSizeBox(height: 20.sp),
              Text(
                'Rate Your Expert',
                style: AppTextStyles.s20w700black,
              ),
              VerticalSizeBox(height: 10.sp),
              Text(
                'Are you Satisfied with your Expert?',
                style: AppTextStyles.s12w500chatPersonName
                    .copyWith(color: AppColors.blackColor),
              ),
              VerticalSizeBox(height: 20.sp),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                unratedColor: AppColors.yellowProgressColor,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, index) => index < expertRatings
                    ? SvgPicture.asset(
                        AppImages.filledStarImage,
                        color: AppColors.yellowProgressColor,
                      )
                    : SvgPicture.asset(
                        AppImages.notFilledStarImage,
                        color: AppColors.yellowProgressColor,
                      ),
                onRatingUpdate: (rating) {
                  setState(() {
                    expertRatings = rating;
                  });
                },
              ),
              VerticalSizeBox(height: 20.sp),
              Card(
                elevation: 5.0,
                color: AppColors.searchBoxBgColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.sp, horizontal: 15.sp),
                  child: TextField(
                    maxLines: 10,
                    decoration: InputDecoration(
                        hintStyle: AppTextStyles.s12w700black
                            .copyWith(color: AppColors.darkGreyColor),
                        hintText: 'Tell us how we can improve...',
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
              ),
              VerticalSizeBox(height: 20.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                      height: 40.sp,
                      width: 130.sp,
                      buttonTitle: 'Submit',
                      buttonColor: AppColors.loginPageBgColor,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return thanksDialog();
                            }));
                      }),
                  CustomButton(
                      height: 40.sp,
                      width: 130.sp,
                      buttonTitle: 'Cancel',
                      buttonColor: AppColors.darkRedColor,
                      onTap: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget thanksDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        height: 250.sp,
        width: 120.sp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      size: 15,
                    ),
                  ),
                )),
            SvgPicture.asset(AppImages.celebrationImage),
            VerticalSizeBox(height: 10.sp),
            Text(
              'Thank You!',
              style: AppTextStyles.s22w700cloginTitle
                  .copyWith(color: AppColors.blackColor),
            ),
            VerticalSizeBox(height: 10.sp),
            SizedBox(
              width: 250.sp,
              child: Text(
                'Your Feedback has been Successfully Submitted!',
                style: AppTextStyles.s18w500white
                    .copyWith(color: AppColors.blackColor),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
