import 'package:effective_sales/app/localization/localization_extension.dart';
import 'package:effective_sales/app/theme/app_theme_colors.dart';
import 'package:effective_sales/app/theme/app_theme_data.dart';
import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({super.key, required this.onRetry});
  final Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_rounded,
            size: 36,
            color: context.myColors.orange,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            context.S.network_error_title,
            style: context.myStyles.title2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            context.S.network_error_body,
            style: context.myStyles.text1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            onPressed: () => onRetry.call(),
            child: SizedBox(
              width: double.infinity,
              height: 24,
              child: Text(
                context.S.network_error_retry,
                textAlign: TextAlign.center,
                style: context.myStyles.buttontext1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
