import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/image_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/constants/widgets_consts.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.05, horizontal: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  )),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppImages.loginPageTopImage),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SvgPicture.asset(AppImages.loginPageBottomImage),
          ),
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.15, horizontal: size.width * 0.1),
                child: Column(
                  children: [
                    const Text('Forgot Passowrd?',
                        style: AppTextStyles.s22w700cloginTitle),
                    const VerticalSizeBox(height: 30),
                    Text(
                      'Enter your email address and we will share',
                      style: AppTextStyles.s12w500cloginFieldHeader
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const VerticalSizeBox(height: 5),
                    Text(
                      'a link to create a new password',
                      style: AppTextStyles.s12w500cloginFieldHeader
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    VerticalSizeBox(height: size.height * 0.1),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Email',
                            style: AppTextStyles.s12w500cloginFieldHeader,
                          ),
                          const VerticalSizeBox(height: 5),
                          Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(4),
                            shadowColor: AppColors.loginFieldValueColor
                                .withOpacity(0.25),
                            child: TextFormField(
                              style: AppTextStyles.s14w500cloginFieldValue,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  hintText: 'abc@example.com',
                                  hintStyle: AppTextStyles.s14w400cloginText,
                                  filled: true,
                                  fillColor: AppColors.loginPageBgColor,
                                  enabledBorder: AppWidgets.enabledBorder,
                                  focusedBorder: AppWidgets.focusedBorder),
                            ),
                          ),
                          const VerticalSizeBox(height: 35),
                          CommonButton(
                            buttonTitle: 'Submit',
                            onTap: () {},
                          ),
                          const VerticalSizeBox(height: 25),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
