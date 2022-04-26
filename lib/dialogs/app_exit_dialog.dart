import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

showAppExitDialog({required BuildContext context}) {
  showGeneralDialog(
    barrierLabel: 'App Exit Dialog',
    barrierDismissible: true,
    transitionDuration: Duration(milliseconds: 700),
    context: context,
    transitionBuilder: (context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
    pageBuilder: (context, anim1, anim2) {
      return Align(
        alignment: Alignment.center,
        child: WillPopScope(
          onWillPop: () => Future.value(false),
          child: AlertDialog(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.error),
                SizedBox(width: 8),
                Text('Attention!!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              ],
            ),
            content: Text('Are you sure to exit packing app?', textAlign: TextAlign.center, style: TextStyle(fontSize: 17)),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('No', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text('Yes', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ],
          ),
        ),
      );
    },
  );
}
