import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/app/theme/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RouteSearchTextField extends StatelessWidget {
  const RouteSearchTextField({
    super.key,
    required this.textController,
    this.onEditingComplete,
    required this.hintText,
    this.cyrrilicInput = false,
    this.enabled,
  });
  final bool? enabled;
  final bool cyrrilicInput;
  final String hintText;
  final TextEditingController textController;
  final Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      maxLines: 1,
      controller: textController,
      style: context.myStyles.buttontext1,
      inputFormatters: [
        if (cyrrilicInput) FilteringTextInputFormatter.allow(RegExp(r'[а-яА-Я]')),
      ],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: hintText,
        hintStyle: context.myStyles.buttontext1.copyWith(
          color: context.myColors.grey6,
        ),
      ),
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
        onEditingComplete?.call();
      },
    );
  }
}
