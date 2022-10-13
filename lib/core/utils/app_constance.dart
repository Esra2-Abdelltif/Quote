import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qoutes/core/utils/app_colors.dart';
import 'package:qoutes/core/utils/app_strings.dart';

class AppConstance{
  static void navigateTo({context,router})=>  Navigator.push(context,MaterialPageRoute(builder: (context) => router));
  static void  navigatePop({context})=>Navigator.pop(context);
  static void navigateByName({context,router})=>  Navigator.pushNamed(context,router);
  static void showErrorDialog({context,required String msg})=> showDialog(context:context,
      builder: (context)=> CupertinoAlertDialog(
        title: Text(msg,style: const TextStyle(fontSize: 25)),
        actions: [
          TextButton(
            onPressed: () => navigatePop(context: context),
            style: TextButton.styleFrom(
                primary: AppColors.black,
                textStyle: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold)),
            child: const Text(AppStrings.ok),
          )
        ],
      ));

  static void showToast(
      {required String msg, Color? color, ToastGravity? gravity}) {
    Fluttertoast.showToast(
        toastLength: Toast.LENGTH_LONG,
        msg: msg,
        backgroundColor: color ?? AppColors.primaryColor,
        gravity: gravity ?? ToastGravity.BOTTOM);
  }


}
