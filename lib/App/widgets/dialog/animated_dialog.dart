import 'package:animations/animations.dart';
import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:myblocdemo/App/data/constants/color_constants.dart';

void showAnimatedDialog(
  BuildContext context, {
  Alignment? alignment,
  Color? color,
  required Widget dialog,
}) {
  showModal(
    configuration: FadeScaleTransitionConfiguration(
      transitionDuration: Duration(milliseconds: 300),
      barrierDismissible: false,
      barrierColor: AppColors.dialogBg.withOpacity(0.8),
    ),
    context: context,
    builder: (context) => FluidDialog(
      edgePadding: EdgeInsets.symmetric(horizontal: 15),
      rootPage: FluidDialogPage(
        alignment: alignment ?? Alignment.topRight,
        decoration: BoxDecoration(
          color: color ?? Colors.transparent,
          borderRadius: BorderRadius.circular(32),
        ),
        builder: (context) => dialog,
      ),
    ),
  );
}
