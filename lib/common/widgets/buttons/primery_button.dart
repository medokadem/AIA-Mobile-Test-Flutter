import 'package:flutter/material.dart';
import '../../config/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final bool isEnabled;
  final String title;
  final Function onClick;
  final Color? color, disabledColor, progressColor;
  final double? radius;
  final String? icon;
  final bool showProgressIndicator;

  const PrimaryButton({
    this.isEnabled = true,
    this.color,
    this.progressColor,
    this.radius,
    required this.title,
    required this.onClick,
    this.showProgressIndicator = false,
    Key? key,
    this.icon, this.disabledColor,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return disabledColor ?? AppColors.secondaryColor.withAlpha(150);
              }
              return color ?? AppColors.secondaryColor;
            },
          ),
          padding:
              WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.all(12)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 8.0),
          )),
          fixedSize: WidgetStateProperty.all<Size>(
              Size(MediaQuery.sizeOf(context).width, 50)),
            overlayColor: WidgetStateProperty.all<Color>(
                AppColors.primaryColor.withOpacity(0.1))
        ),
        onPressed: isEnabled
            ? () {
                onClick();
              }
            : null,
        child: showProgressIndicator == true?
         Center(child: SizedBox(width:26, height:26, child: CircularProgressIndicator(color: progressColor??AppColors.primaryColor, strokeWidth: 2,))):icon == null
            ? Text(title,
                style: TextStyle(
                    fontSize: 14,
                    color: isEnabled ? AppColors.white : AppColors.white.withAlpha(220),
                    fontWeight: FontWeight.w700))
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  Text(title,
                      style: TextStyle(
                          fontSize: 14,
                          color: isEnabled ? AppColors.white : AppColors.white.withAlpha(220),
                          fontWeight: FontWeight.w700)),
                ],
              ));
  }
}
