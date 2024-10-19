import 'package:flutter/material.dart';
import 'package:myblocdemo/App/data/constants/color_constants.dart';

class SimpleAlertDialog {
  static void show({
    required BuildContext context,
    required String title,
    required String description,
    required Function(bool res) onAction,
    String positiveText = "Ok",
    String negativeText = "Cancel",
    bool showNegativeButon = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: AppColors.dialogBg.withOpacity(0.8),
      builder: (BuildContext contexts) => AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: Text(
          title,
          style: TextStyle(
            //fontFamily: FontFamilies.urbanist,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Text(
          description,
          style: TextStyle(
            // fontFamily: FontFamilies.mdprimertest,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          side: BorderSide(
            color: Theme.of(context).colorScheme.scrim,
            width: 2,
          ),
        ),
        actions: <Widget>[
          if (showNegativeButon) ...[
            InkWell(
              onTap: () {
                Navigator.pop(contexts, false);
                onAction.call(false);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              child: Container(
                width: 120,
                height: 40,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.scrim,
                    width: 2,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  negativeText,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    // fontFamily: FontFamilies.mdprimertest,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              Navigator.pop(contexts, true);
              onAction.call(true);
            },
            child: Container(
              width: 120,
              height: 40,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Theme.of(context).colorScheme.scrim,
                  width: 2,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                positiveText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  // fontFamily: FontFamilies.mdprimertest,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
