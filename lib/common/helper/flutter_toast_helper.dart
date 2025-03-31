import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/svg.dart';

import '../../catalog/enums/lang_type.dart';
import '../config/app_constants/app_vectors.dart';
import '../config/shared_data.dart';


class FlutterToastHelper {
  static showSuccessFlutterToast(
      {required BuildContext context,
       int? duration,
      required String message,
      StyledToastPosition position = StyledToastPosition.top}) {
    bool isArabic = SharedData.shared.langType == LangType.arabic;

    showToastWidget(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: const BorderSide(
                    color: Color.fromARGB(255, 171, 239, 198))),
            color: const Color.fromARGB(255, 236, 253, 243),
          ),
          child: Row(
            children: [
              isArabic
                  ? InkWell(
                      onTap: () {
                        dismissAllToast();
                      },
                      child: SvgPicture.asset(
                        AppVectors.cancel,
                        color: const Color.fromARGB(255, 6, 118, 71),
                      ),
                    )
                  : SvgPicture.asset(
                      AppVectors.check,
                      color: const Color.fromARGB(255, 6, 118, 71),
                    ),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        message,
                        style:  TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color.fromARGB(255, 6, 118, 71),
                        ),
                        textAlign: TextAlign.start,
                        textDirection:
                            SharedData.shared.langType == LangType.arabic
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                      ))),
              isArabic
                  ? SvgPicture.asset(AppVectors.check,
                      color: const Color.fromARGB(255, 6, 118, 71))
                  : InkWell(
                      onTap: () {
                        dismissAllToast();
                      },
                      child: SvgPicture.asset(
                        AppVectors.cancel,
                        color: Colors.white,
                      ),
                    ),
            ],
          ),
        ),
      ),
      context: context,
      isIgnoring: false,
      position: position,
      reverseAnimation: StyledToastAnimation.slideToTop,
      duration:  Duration(seconds:duration?? 4),
    );
  }

  static showErrorFlutterToast(
      {required BuildContext context,
      required String message,
       int? duration,

      StyledToastPosition position = StyledToastPosition.top}) {
    bool isArabic = SharedData.shared.langType == LangType.arabic;

    showToastWidget(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side:
                    const BorderSide(color: Color.fromARGB(255, 180, 70, 50))),
            color: const Color.fromARGB(255, 254, 243, 242),
          ),
          child: Row(
            children: [
              isArabic
                  ? InkWell(
                      onTap: () {
                        dismissAllToast();
                      },
                      child: SvgPicture.asset(
                        AppVectors.cancel,
                        color: const Color.fromARGB(255, 180, 35, 24),
                      ),
                    )
                  : SvgPicture.asset(
                      AppVectors.blocked,
                      color: const Color.fromARGB(255, 180, 35, 24),
                    ),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        message,
                        style:  TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 180, 35, 24),
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                        textDirection:
                            SharedData.shared.langType == LangType.arabic
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                      ))),
              isArabic
                  ? SvgPicture.asset(
                      AppVectors.blocked,
                      color: const Color.fromARGB(255, 180, 35, 24),
                    )
                  : InkWell(
                      onTap: () {
                        dismissAllToast();
                      },
                      child: SvgPicture.asset(
                        AppVectors.cancel,
                        color: const Color.fromARGB(255, 180, 35, 24),
                      ),
                    ),
            ],
          ),
        ),
      ),
      context: context,
      isIgnoring: true,

      /// Need To check if ios issue solved.
      position: position,
      reverseAnimation: StyledToastAnimation.slideToTop,
      duration:  Duration(seconds:duration?? 4),
    );
  }

  static showInfoFlutterToast(
      {required BuildContext context,
       int? duration,
      required String message,
      StyledToastPosition position = StyledToastPosition.top}) {
    bool isArabic = SharedData.shared.langType == LangType.arabic;

    showToastWidget(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: const BorderSide(
                    color: Color.fromARGB(255, 234, 236, 240))),
            color: const Color.fromARGB(255, 249, 250, 251),
          ),
          child: Row(
            children: [
              if (isArabic)
                InkWell(
                  onTap: () {
                    dismissAllToast();
                  },
                  child: SvgPicture.asset(
                    AppVectors.cancel,
                    color: const Color.fromARGB(255, 52, 64, 84),
                  ),
                )
              else
                const Icon(
                  Icons.info_outline,
                  color: Color.fromARGB(255, 52, 64, 84),
                ),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        message,
                        style:  TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color.fromARGB(255, 52, 64, 84),
                        ),
                        textAlign: TextAlign.start,
                        textDirection:
                            SharedData.shared.langType == LangType.arabic
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                      ))),
              isArabic
                  ? const Icon(Icons.info_outline,
                      color: Color.fromARGB(255, 52, 64, 84))
                  : InkWell(
                      onTap: () {
                        dismissAllToast();
                      },
                      child: SvgPicture.asset(
                        AppVectors.cancel,
                        color: const Color.fromARGB(255, 52, 64, 84),
                      ),
                    ),
            ],
          ),
        ),
      ),
      context: context,
      isIgnoring: false,
      position: position,
      reverseAnimation: StyledToastAnimation.slideToTop,
      duration:  Duration(seconds:duration?? 4),
    );
  }
}
