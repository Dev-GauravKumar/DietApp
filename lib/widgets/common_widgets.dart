import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/constants/text_style_consts.dart';
import 'package:flutter/material.dart';

class VerticalSizeBox extends StatelessWidget {
  const VerticalSizeBox({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class HorizontalSizedBox extends StatelessWidget {
  const HorizontalSizedBox({
    super.key,
    required this.width,
  });
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

class CommonButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String buttonTitle;
  final double? width;

  const CommonButton(
      {Key? key, required this.onTap, required this.buttonTitle, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return SizedBox(
      height: 55,
      width: width ?? 316,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 5,
          primary: AppColors.loginPageTitleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Text(buttonTitle, style: AppTextStyles.s16w600cloginBg),
      ),
    );
  }
}

class CompulsoryHeader extends StatelessWidget {
  const CompulsoryHeader({super.key, required this.header});
  final String header;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: header,
        style: AppTextStyles.s12w500cloginFieldHeader,
      ),
      TextSpan(
        text: '*',
        style:
            AppTextStyles.s12w500cloginFieldHeader.copyWith(color: Colors.red),
      ),
    ]));
  }
}
