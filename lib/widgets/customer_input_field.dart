import 'package:flutter/material.dart';
import 'package:odin/theme/app_themes.dart';

class CustomerInputField extends StatelessWidget {

  final String hintText;
  final String labelText;
  final IconData icon;
  final bool? obscureText;
  final void Function(String)? onChange;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool autofocus;

  const CustomerInputField({
    Key? key, 
    required this.hintText, 
    required this.labelText, 
    required this.icon,
    this.obscureText, 
    this.onChange, 
    this.validator,
    this.keyboardType, 
    this.autofocus = false
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      autofocus: autofocus,
      obscureText: obscureText != null ? obscureText! : false,
      cursorColor: AppThemes.colorPrimary,
      keyboardType: keyboardType,

      onChanged: onChange,

      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,

      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: AppThemes.colorPrimary),
        prefixIcon: Icon(icon, color: AppThemes.colorPrimary,),
      ),
    );
  }
}