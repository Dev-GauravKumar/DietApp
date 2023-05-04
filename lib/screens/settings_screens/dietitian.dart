import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/image_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DietitianBio extends StatelessWidget {
  const DietitianBio({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: simpleAppBar(context, title: 'Dietitian Biodata'),
      body: SizedBox(
        height: _size.height * 0.56,
        width: _size.width,
        child: Image.network(
          'https://img.freepik.com/free-photo/asian-female-doctor-physician-medical-uniform-with-stethoscope-cross-arms-chest-smiling-looking-like-professional-white-background_1258-83205.jpg?w=996&t=st=1683124508~exp=1683125108~hmac=b466a99dabddb96e8afca6161f774cf26eaa0f0b5901ba63266ea7baf68dc443',
          fit: BoxFit.cover,
        ),
      ),
      bottomSheet: SizedBox(
          height: _size.height * 0.35,
          width: _size.width,
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            elevation: 0.0,
            color: AppColors.searchBoxBgColor,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 5.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. Jane Doe',
                    style: AppTextStyles.s22w600black
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  VerticalSizeBox(height: 5.sp),
                  Text(
                    'Dietitian',
                    style: AppTextStyles.s18w500white
                        .copyWith(color: AppColors.blackColor),
                  ),
                  VerticalSizeBox(height: 15.sp),
                  Text(
                    'Biography',
                    style: AppTextStyles.s18w700black,
                  ),
                  VerticalSizeBox(height: 10.sp),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: AppTextStyles.s14w500cloginFieldValue
                        .copyWith(color: AppColors.blackColor),
                  ),
                  VerticalSizeBox(height: 30.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 170,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: AppColors.loginPageBgColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: Text(
                            'Book Appointment',
                            style: AppTextStyles.s16w500black.copyWith(
                                color: AppColors.loginFieldValueColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 160,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: AppColors.loginPageTitleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: Text(
                            'Message',
                            style: AppTextStyles.s16w500black.copyWith(
                                color: AppColors.loginFieldValueColor),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
