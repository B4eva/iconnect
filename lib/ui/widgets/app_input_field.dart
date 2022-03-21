import 'package:flutter/material.dart';
import 'package:iconnect/ui/shared/app_colors.dart';
import 'package:iconnect/ui/shared/app_text.dart';

class AppInputField extends StatelessWidget {
  final String hintPlaceHolder;
  final Color? filledColor;
  final ValueChanged<String?>? onSaved;
  final String? lable;
  final int? maxLines;
  final Widget? trailing;
  final Widget? leading;
  final TextInputType? inputType;
  final bool password;
  final TextEditingController? controller;
  final void Function()? onTrailingTapped;
  final FormFieldValidator<String>? validator;
  final int? maxLength;
  final Color surffixColor;
  final bool disableBorder;

  const AppInputField(
      {Key? key,
      this.hintPlaceHolder = '',
      this.filledColor = kPrimaryColor,
      this.onSaved,
      this.lable,
      this.maxLines,
      this.trailing,
      this.leading,
      this.inputType,
      this.password = false,
      this.controller,
      this.onTrailingTapped,
      this.validator,
      this.maxLength,
      this.surffixColor = kPrimaryColor,
      this.disableBorder = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Visibility(
          visible: lable == null ? false : true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: AppText.caption(lable ?? '', key),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.text,
            validator: validator,
            autofocus: false,
            obscureText: password,
            maxLength: maxLength,
            onChanged: onSaved,
            cursorColor: Theme.of(context).colorScheme.secondary,
            textInputAction: TextInputAction.none,
            maxLines: maxLines ?? 1,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              border: disableBorder ? InputBorder.none : null,
              fillColor: filledColor,
              filled: false,
              suffixStyle: TextStyle(color: surffixColor),
              suffixIcon: trailing != null
                  ? GestureDetector(
                      onTap: onTrailingTapped,
                      child: trailing,
                    )
                  : null,
              prefix: leading,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              hintText: hintPlaceHolder,
              hintStyle:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              errorBorder: disableBorder
                  ? null
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
              enabledBorder: disableBorder
                  ? null
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          const BorderSide(color: kPrimaryColor, width: 0.5),
                    ),
              focusedBorder: disableBorder
                  ? null
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          const BorderSide(color: kPrimaryColor, width: 0.5),
                    ),
            ),
          ),
        )
      ],
    );
  }
}
