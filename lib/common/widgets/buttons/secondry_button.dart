import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final Function onClick;
  final Color color, textColor;

  const SecondaryButton({
    required this.title,
    required this.onClick,
    this.color = AppColors.primaryColor,
    this.textColor = AppColors.primaryColor,
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.all(12)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: color, width: 1.0),
          )),
          overlayColor: WidgetStateProperty.all<Color>(color.withOpacity(.1)),
          fixedSize: WidgetStateProperty.all<Size>(Size(MediaQuery.sizeOf(context).width, 50)),
        ),
        onPressed: () {
          onClick();
        },
        child: Text(title,
            style: TextStyle(fontSize: 14, color: textColor, fontWeight: FontWeight.w700)));
  }
}
