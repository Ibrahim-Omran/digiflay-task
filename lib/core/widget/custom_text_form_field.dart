import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.validator,
    this.obscureText = false,
    this.iconSuffix,
    this.suffixIconOnPressed,
    this.keyboardType,
    this.readOnly = false,
    this.enabledBorder,
    this.focusedBorder,
    this.hintStyle,
    this.border,
    this.filled,
    this.fillColor,
    this.onChanged,
    this.colorCrsor,
    this.maxLines = 1,
   this.expands = false,
    this.contentPadding,
    this.errorBorder,
    this.label, this.icon, this.prefixIcon, this.suffixIcon,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final IconData? iconSuffix;
  final VoidCallback? suffixIconOnPressed;
  final TextInputType? keyboardType;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final TextStyle? hintStyle;
  final InputBorder? border;
  final bool? filled;
  final Color? fillColor;
  final Color? colorCrsor;
  final int? maxLines;
  final bool expands;
  final Widget? label;
  final Widget? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final void Function(String)? onChanged;

  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
        controller: controller,
        cursorColor: AppColors.black,
        validator: validator,
        obscureText: obscureText,
        keyboardType: keyboardType,
        readOnly: readOnly,
        style: const TextStyle(
          color: AppColors.black,
        ),


        //textDirection: TextDirection.rtl,
        onChanged: onChanged,
        maxLines: maxLines,
        expands: expands,



        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          label: label,
          labelText: labelText,

          labelStyle: const TextStyle(
            color: AppColors.grey,
            fontSize: 20
          ),
          contentPadding: contentPadding,
          icon: icon,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.grey
          ),

          border: border,
          filled: filled,
          fillColor: fillColor,

          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          errorBorder: errorBorder,


          suffixIconConstraints: BoxConstraints(
            minHeight: 60.h
          ),

          suffixIcon: suffixIcon ?? IconButton(
            onPressed: suffixIconOnPressed,
            icon: Icon(
              iconSuffix,
              color: AppColors.greyVeryLite,
            ),
          ),




        ),
      );
  }
}
