import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class CustomTextFields extends StatelessWidget {
  const CustomTextFields({
    super.key,
    this.textFieldName = '',
    this.hintText = '',
    this.maxLength,
    this.maxLine = 1,
    this.trailingIcon,
    this.leadingIcon,
    this.filled = false,
    this.autoFocus = false,
    this.readOnly = false,
    this.enable = true,
    this.inputBorder,
    this.validator,
    this.textInputType = TextInputType.text,
    this.textCapitalization = TextCapitalization.sentences,
    this.onChange,
    this.onSubmitted,
    this.textInputAction,
    this.focusNode = true,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    this.contentPadding,
    required this.textFieldController,
  });

  final Widget? trailingIcon;
  final Widget? leadingIcon;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final String textFieldName;
  final String hintText;
  final int? maxLength;
  final int? maxLine;
  final TextInputType textInputType;

  final bool filled;
  final bool readOnly;
  final bool enable;
  final bool autoFocus;
  final TextEditingController textFieldController;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final InputBorder? inputBorder;
  final bool focusNode;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            onTapOutside: focusNode ? (event) => FocusManager.instance.primaryFocus?.unfocus() : null,
            textInputAction: textInputAction,
            minLines: maxLine,
            maxLines: 5,
            maxLength: maxLength,
            textCapitalization: textCapitalization,
            autofocus: autoFocus,
            validator: validator,
            keyboardType: textInputType,
            controller: textFieldController,
            readOnly: readOnly,
            enabled: enable,
            style: TextStyle(color: AppColors.black),
            decoration: InputDecoration(
              contentPadding: contentPadding,
              border: inputBorder,
              filled: readOnly ? true : filled,
              fillColor: readOnly ? AppColors.lightBorder : AppColors.lightGrey,
              hintText: hintText,
              counterText: "",
              suffixIcon: trailingIcon,
              prefixIcon: leadingIcon,
            ),
            onChanged: onChange,
            onFieldSubmitted: onSubmitted,
            inputFormatters: [NoLeadingSpaceFormatter()],
          )
        ],
      ),
    );
  }
}

class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.startsWith(' ')) {
      final String trimmedText = newValue.text.trimLeft();
      return TextEditingValue(
        text: trimmedText,
        selection: TextSelection(
          baseOffset: trimmedText.length,
          extentOffset: trimmedText.length,
        ),
      );
    }

    return newValue;
  }
}
