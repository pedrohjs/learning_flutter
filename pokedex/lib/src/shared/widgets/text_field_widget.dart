import 'package:flutter/material.dart';
import 'package:pokedex/src/utils/colors_util.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? hintText;
  final Widget? prefixIcon;
  final TextCapitalization? textCapitalization;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  TextFieldWidget({
    required this.controller,
    this.focusNode,
    this.hintText,
    this.prefixIcon,
    this.textCapitalization,
    this.textInputType,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      focusNode: this.focusNode,
      cursorColor: ColorsUtil.darkGrey,
      style: TextStyle(
        color: ColorsUtil.darkGrey,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      keyboardType: this.textInputType ?? TextInputType.text,
      textCapitalization: this.textCapitalization ?? TextCapitalization.none,
      decoration: InputDecoration(
        hintText: this.hintText,
        hintStyle: TextStyle(
            color: ColorsUtil.lightGrey,
            fontSize: 16,
            fontWeight: FontWeight.normal),
        prefixIcon: this.prefixIcon != null
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: this.prefixIcon,
              )
            : null,
        filled: true,
        fillColor: ColorsUtil.inputBackground,
        hoverColor: ColorsUtil.inputBackground,
        focusColor: ColorsUtil.inputBackground,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      onChanged: this.onChanged,
      onSubmitted: this.onSubmitted,
    );
  }
}
