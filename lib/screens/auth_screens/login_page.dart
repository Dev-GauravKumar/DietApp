import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/image_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/constants/widgets_consts.dart';
import 'package:diet_app/route/routes.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isBoxChecked = false;
  bool _showPassword = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: [
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
                padding: EdgeInsets.only(top: size.height * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppImages.loginPageTitleImage),
                    const VerticalSizeBox(height: 21),
                    const Text(
                      'Log in to your Account',
                      style: AppTextStyles.s22w700cloginTitle,
                    ),
                    const VerticalSizeBox(height: 5),
                    const Text(
                      'Welcome back, please enter your details.',
                      style: AppTextStyles.s14w400cloginText,
                    ),
                    const VerticalSizeBox(height: 45),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Email Address',
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
                                    filled: true,
                                    fillColor: AppColors.loginPageBgColor,
                                    enabledBorder: AppWidgets.enabledBorder,
                                    focusedBorder: AppWidgets.focusedBorder),
                              ),
                            ),
                            const VerticalSizeBox(height: 16),
                            const Text(
                              'Password',
                              style: AppTextStyles.s12w500cloginFieldHeader,
                            ),
                            const VerticalSizeBox(height: 5),
                            Material(
                              elevation: 2,
                              borderRadius: BorderRadius.circular(4),
                              shadowColor: AppColors.loginFieldValueColor
                                  .withOpacity(0.25),
                              child: TextFormField(
                                obscureText: !_showPassword ? true : false,
                                style: AppTextStyles.s14w500cloginFieldValue,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.loginPageBgColor,
                                  enabledBorder: AppWidgets.enabledBorder,
                                  focusedBorder: AppWidgets.focusedBorder,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _showPassword = !_showPassword;
                                      });
                                    },
                                    icon: Icon(
                                      _showPassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: AppColors.loginFieldValueColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isBoxChecked = !_isBoxChecked;
                                        });
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: _isBoxChecked
                                                ? AppColors.loginPageTitleColor
                                                : Colors.transparent,
                                            border: Border.all(
                                                color: _isBoxChecked
                                                    ? AppColors
                                                        .loginPageTitleColor
                                                    : AppColors
                                                        .loginFieldHeaderColor),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: _isBoxChecked
                                            ? const Icon(
                                                Icons.check,
                                                size: 15,
                                                color:
                                                    AppColors.loginPageBgColor,
                                              )
                                            : const SizedBox(),
                                      ),
                                    ),
                                    const HorizontalSizedBox(width: 10),
                                    Text(
                                      'Remember me',
                                      style: AppTextStyles.s14w400cloginText
                                          .copyWith(fontSize: 13),
                                    ),
                                  ],
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context,
                                          RouteGenerator.forgotPasswordPage);
                                    },
                                    child: Text(
                                      'Forgot Password?',
                                      style: AppTextStyles.s22w700cloginTitle
                                          .copyWith(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                    ))
                              ],
                            ),
                            const VerticalSizeBox(height: 35),
                            CommonButton(
                              buttonTitle: 'Sign In',
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteGenerator.homePage);
                              },
                            ),
                            const VerticalSizeBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don’t have an account?',
                                  style: AppTextStyles.s14w500cloginFieldValue
                                      .copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RouteGenerator.signUpPage);
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: AppTextStyles.s22w700cloginTitle
                                        .copyWith(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
