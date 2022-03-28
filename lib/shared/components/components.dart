import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hexcolor/hexcolor.dart';




void navigateToAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}





Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  VoidCallback? onTap,
  bool obscureText = false,
  FormFieldValidator<String>? validate,
  String ?label,
  String? hintText,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isClickable = true,
  Color? hintColor,
  Color? prefixColor,
}) =>
    TextFormField(
      cursorColor: Colors.pink,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,

      decoration: InputDecoration(

        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color:secondaryColor,width:2 )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color:secondaryColor,width: 2)
        ),
        labelText: label ,
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor),
        prefixIcon: Icon(
          prefix,
          color: prefixColor,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,

      ),
    );



Widget defaultTextButton({
  final double fontSize = 20.0,
  required Function onPressed,
  required String text,

}) =>
    TextButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );



Widget defaultButton(
    {
      double width = double.infinity,
      double radius = 0.0,
      double? fontSize,
      FontWeight fontWeight = FontWeight.normal,
      required Function onPressed,
      required String text,
      bool isUpperCase = true,
    }) => Container(
  width: width,
  height: 50,
  decoration: BoxDecoration(
      color: Colors.pink,
      borderRadius: BorderRadius.circular(radius)),
  child: MaterialButton(
    focusColor: Colors.pink,
    onPressed: () {
      onPressed();
    },
    child: Text(
      isUpperCase ? text.toUpperCase() : text,
      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: fontSize),
    ),
  ),
);


void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}
