import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/resources/app_context_extension.dart';

class NumberOnlyInputBox extends StatelessWidget {
  const NumberOnlyInputBox({
    Key? key,
    required this.context,
    required this.controller,
    this.maxLengthTextInput,
  }) : super(key: key);

  final BuildContext context;
  final TextEditingController controller;
  final int? maxLengthTextInput;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: 75,
        height: 75,
        color: context.resources.color.colorNeutral,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: TextField(
          decoration: const InputDecoration(border: InputBorder.none),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          controller: controller,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w500,
          ),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            // Brazil's highest DDD number is 99
            if (maxLengthTextInput != null)
              LengthLimitingTextInputFormatter(maxLengthTextInput),
          ],
        ),
      ),
    );
  }
}
