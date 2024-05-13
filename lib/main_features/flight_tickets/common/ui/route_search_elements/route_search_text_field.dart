import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/app/theme/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RouteSearchTextField extends StatefulWidget {
  const RouteSearchTextField({
    super.key,
    this.onEditingComplete,
    required this.hintText,
    this.cyrrilicInput = false,
    this.enabled,
    this.initialValue,
  });
  final bool? enabled;
  final bool cyrrilicInput;
  final String hintText;
  final String? initialValue;
  final Function(String)? onEditingComplete;

  @override
  State<RouteSearchTextField> createState() => _RouteSearchTextFieldState();
}

class _RouteSearchTextFieldState extends State<RouteSearchTextField> {
  late final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    _textController.text = widget.initialValue ?? '';
    super.initState();
  }

  @override
  void didUpdateWidget(covariant RouteSearchTextField oldWidget) {
    _textController.text = widget.initialValue ?? '';
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.enabled,
      maxLines: 1,
      controller: _textController,
      style: context.myStyles.buttontext1,
      inputFormatters: [
        if (widget.cyrrilicInput)
          FilteringTextInputFormatter.allow(
            RegExp(r'[а-яА-Я\s]'),
          ),
      ],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: widget.hintText,
        hintStyle: context.myStyles.buttontext1.copyWith(
          color: context.myColors.grey6,
        ),
      ),
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
        widget.onEditingComplete?.call(
          _textController.text.trim(),
        );
      },
    );
  }
}
