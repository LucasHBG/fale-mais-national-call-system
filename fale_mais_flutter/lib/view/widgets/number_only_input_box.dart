import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/resources/app_context_extension.dart';

class NumberOnlyRoundedInputBox extends StatelessWidget {
  const NumberOnlyRoundedInputBox({
    Key? key,
    required this.context,
    required this.controller,
    this.maxLengthTextInput = 3,
    this.inputWidth = 75.0,
    this.inputHeight = 75.0,
    this.inputFontSize = 40.0,
  }) : super(key: key);

  final BuildContext context;
  final TextEditingController controller;
  final int maxLengthTextInput;
  final double inputWidth;
  final double inputHeight;
  final double inputFontSize;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: inputWidth,
        height: inputHeight,
        color: context.resources.color.colorNeutral,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: TextField(
          decoration: const InputDecoration(border: InputBorder.none),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          controller: controller,
          style: TextStyle(
            fontSize: inputFontSize,
            fontWeight: FontWeight.w500,
          ),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            // Brazil's highest DDD number is 99
            LengthLimitingTextInputFormatter(maxLengthTextInput),
          ],
        ),
      ),
    );
  }
}
