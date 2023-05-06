import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/image_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:diet_app/constants/widgets_consts.dart';
import 'package:diet_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String? currentState;
  String? currentSource;
  List<String> states = ["Punjab", "Haryana", "Himachal", "Uttrakhand"];
  List<String> sourceItems = ["Internet", "Friend"];
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // resizeToAvoidBottomInset: false,
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
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(AppImages.loginPageTitleImage),
                      const VerticalSizeBox(height: 21),
                      const Text(
                        'Create an Account',
                        style: AppTextStyles.s22w700cloginTitle,
                      ),
                      const VerticalSizeBox(height: 5),
                      const Text(
                        'Sign up now to get started with an account.',
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
                              const CompulsoryHeader(header: 'Full Name'),
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
                                    focusedBorder: AppWidgets.focusedBorder,
                                  ),
                                ),
                              ),
                              const VerticalSizeBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CompulsoryHeader(
                                          header: 'Date of Birth'),
                                      const VerticalSizeBox(height: 5),
                                      SizedBox(
                                        width: size.width * 0.35,
                                        child: Material(
                                          elevation: 2,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          shadowColor: AppColors
                                              .loginFieldValueColor
                                              .withOpacity(0.25),
                                          child: TextFormField(
                                            style: AppTextStyles
                                                .s14w500cloginFieldValue,
                                            keyboardType:
                                                TextInputType.datetime,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15,
                                                      horizontal: 10),
                                              filled: true,
                                              fillColor:
                                                  AppColors.loginPageBgColor,
                                              enabledBorder:
                                                  AppWidgets.enabledBorder,
                                              focusedBorder:
                                                  AppWidgets.focusedBorder,
                                              suffixIcon: GestureDetector(
                                                onTap: () {
                                                  showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime.now(),
                                                      lastDate: DateTime.now());
                                                },
                                                child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    height: 10,
                                                    width: 10,
                                                    child: SvgPicture.asset(
                                                        AppImages
                                                            .loginPageCalendarIcon)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CompulsoryHeader(header: 'Age'),
                                      const VerticalSizeBox(height: 5),
                                      SizedBox(
                                        width: size.width * 0.35,
                                        child: Material(
                                          elevation: 2,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          shadowColor: AppColors
                                              .loginFieldValueColor
                                              .withOpacity(0.25),
                                          child: TextFormField(
                                            style: AppTextStyles
                                                .s14w500cloginFieldValue,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15,
                                                      horizontal: 10),
                                              filled: true,
                                              fillColor:
                                                  AppColors.loginPageBgColor,
                                              enabledBorder:
                                                  AppWidgets.enabledBorder,
                                              focusedBorder:
                                                  AppWidgets.focusedBorder,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const VerticalSizeBox(height: 15),
                              const CompulsoryHeader(header: 'Contact Number'),
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
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    filled: true,
                                    fillColor: AppColors.loginPageBgColor,
                                    enabledBorder: AppWidgets.enabledBorder,
                                    focusedBorder: AppWidgets.focusedBorder,
                                  ),
                                ),
                              ),
                              const VerticalSizeBox(height: 15),
                              const CompulsoryHeader(header: 'State'),
                              const VerticalSizeBox(height: 5),
                              Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(4),
                                shadowColor: AppColors.loginFieldValueColor
                                    .withOpacity(0.25),
                                child: DropdownButtonFormField<String>(
                                  value: currentState,
                                  items: states
                                      .map((item) => DropdownMenuItem<String>(
                                          value: item, child: Text(item)))
                                      .toList(),
                                  onChanged: (value) => setState(
                                    () {
                                      value != null
                                          ? currentState = value
                                          : null;
                                    },
                                  ),
                                  iconSize: 30,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: AppColors.loginPageTitleColor,
                                  ),
                                  dropdownColor: AppColors.loginPageBgColor,
                                  style: AppTextStyles.s14w500cloginFieldValue,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.loginPageBgColor,
                                      enabledBorder: AppWidgets.enabledBorder,
                                      focusedBorder: AppWidgets.focusedBorder,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 10)),
                                ),
                              
                              ),
                              const VerticalSizeBox(height: 15),
                              const CompulsoryHeader(
                                  header: 'Reason for Signing Up'),
                              const VerticalSizeBox(height: 5),
                              Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(4),
                                shadowColor: AppColors.loginFieldValueColor
                                    .withOpacity(0.25),
                                child: TextFormField(
                                  maxLines: 5,
                                  style: AppTextStyles.s14w500cloginFieldValue,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.loginPageBgColor,
                                    enabledBorder: AppWidgets.enabledBorder,
                                    focusedBorder: AppWidgets.focusedBorder,
                                  ),
                                ),
                              ),
                              const VerticalSizeBox(height: 15),
                              const CompulsoryHeader(
                                  header:
                                      'How did you find out about Diet Ideas?'),
                              const VerticalSizeBox(height: 5),
                              Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(4),
                                shadowColor: AppColors.loginFieldValueColor
                                    .withOpacity(0.25),
                                child: DropdownButtonFormField<String>(
                                  value: currentSource,
                                  items: sourceItems
                                      .map((item) => DropdownMenuItem<String>(
                                          value: item, child: Text(item)))
                                      .toList(),
                                  onChanged: (value) => setState(
                                    () {
                                      value != null
                                          ? currentSource = value
                                          : null;
                                    },
                                  ),
                                  iconSize: 30,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: AppColors.loginPageTitleColor,
                                  ),
                                  dropdownColor: AppColors.loginPageBgColor,
                                  style: AppTextStyles.s14w500cloginFieldValue,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.loginPageBgColor,
                                      enabledBorder: AppWidgets.enabledBorder,
                                      focusedBorder: AppWidgets.focusedBorder,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 10)),
                                ),
                              ),
                              const VerticalSizeBox(height: 15),
                              const CompulsoryHeader(header: 'Password'),
                              const VerticalSizeBox(height: 5),
                              Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(4),
                                shadowColor: AppColors.loginFieldValueColor
                                    .withOpacity(0.25),
                                child: TextFormField(
                                  style: AppTextStyles.s14w500cloginFieldValue,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: !_showPassword,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
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
                              const VerticalSizeBox(height: 15),
                              const CompulsoryHeader(
                                  header: 'Confirm Password'),
                              const VerticalSizeBox(height: 5),
                              Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(4),
                                shadowColor: AppColors.loginFieldValueColor
                                    .withOpacity(0.25),
                                child: TextFormField(
                                  style: AppTextStyles.s14w500cloginFieldValue,
                                  keyboardType: TextInputType.emailAddress,
                                  obscureText: !_showConfirmPassword,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    filled: true,
                                    fillColor: AppColors.loginPageBgColor,
                                    enabledBorder: AppWidgets.enabledBorder,
                                    focusedBorder: AppWidgets.focusedBorder,
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _showConfirmPassword =
                                              !_showConfirmPassword;
                                        });
                                      },
                                      icon: Icon(
                                        _showConfirmPassword
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: AppColors.loginFieldValueColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const VerticalSizeBox(height: 35),
                              CommonButton(
                                buttonTitle: 'Sign Up',
                                onTap: () {},
                              ),
                              const VerticalSizeBox(height: 25),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account?',
                                    style: AppTextStyles.s14w500cloginFieldValue
                                        .copyWith(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    'Sign In',
                                    style: AppTextStyles.s22w700cloginTitle
                                        .copyWith(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600),
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
            ),
          ],
        ));
  }
}
