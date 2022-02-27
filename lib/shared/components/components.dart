import 'package:flutter/material.dart';
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
}) =>
    Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: secondaryColor,
      ),
      child: TextFormField(
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
              borderSide: BorderSide(color:secondaryColor,)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color:secondaryColor,)
          ),
          labelText: label,
          hintText: hintText,
          prefixIcon: Icon(
            prefix,
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

var pageController = PageController();
Widget defaultButton(
    {
      double width = double.infinity,
      double radius = 0.0,
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
      style: TextStyle(color: Colors.white),
    ),
  ),
);