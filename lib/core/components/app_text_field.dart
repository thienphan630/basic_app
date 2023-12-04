import 'package:basic_app/core/util/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField(
      {Key? key,
      required this.controller,
      this.hintText,
      this.minLines,
      this.suffixIcon,
      this.prefixIcon,
      this.textError,
      this.labelText,
      this.onEditingComplete,
      this.textInputAction,
      this.maxLength,
      this.keyboardType,
      this.onChanged,
      this.floatingLabelBehavior,
      this.showAllBorder = false,
      this.onClear,
      this.showClear = false,
      this.validator,
      this.obscuringCharacter,
      this.obscureText,
      this.fillColor})
      : super(key: key);

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final int? minLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? textError;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;

  final int? maxLength;
  final TextInputType? keyboardType;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool showAllBorder;
  final bool showClear;
  final Function()? onClear;
  final String? obscuringCharacter;
  final bool? obscureText;
  final Color? fillColor;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    gapPadding: 4,
    borderSide: BorderSide(color: AppColor.kPrimary),
  );

  var focusOutlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    gapPadding: 4,
    borderSide: BorderSide(color: AppColor.kPrimary),
  );

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: AppColor.kPrimary,
            ),
      ),
      child: TextFormField(
          // obscuringCharacter: obscuringCharacter ?? '•',
          obscureText: widget.obscureText ?? false,
          controller: widget.controller,
          maxLength: widget.maxLength,
          minLines: widget.minLines,
          maxLines: widget.minLines != null ? 10 : 1,
          keyboardType: widget.keyboardType,
          style: const TextStyle(
              color: Colors.black87, fontSize: 16, letterSpacing: 0.25),
          decoration: !widget.showAllBorder
              ? InputDecoration(
                  counterText: "",
                  floatingLabelBehavior: widget.floatingLabelBehavior,
                  isDense: true,
                  labelText: widget.labelText,
                  labelStyle: TextStyle(
                      color: AppColor.kPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  hintStyle: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w400),
                  hintText: widget.hintText,

                  filled: true,
                  fillColor: widget.fillColor ?? Colors.white,
                  alignLabelWithHint: true,
                  errorText:
                      widget.textError == null || widget.textError!.isEmpty
                          ? null
                          : widget.textError,

                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  suffixIcon: widget.suffixIcon ??
                      (widget.showClear && widget.controller.text.isNotEmpty
                          ? IconButton(
                              onPressed: widget.onClear ??
                                  () {
                                    widget.controller.clear();
                                    setState(() {});
                                  },
                              icon: const Icon(
                                Icons.close,
                                size: 24,
                              ))
                          : null),
                  prefixIcon: widget.prefixIcon,
                  // enabledBorder: UnderlineInputBorder(
                  //   borderSide:
                  //       BorderSide(color: AppColor.kPrimary, width: 0.5),
                  //   borderRadius: const BorderRadius.all(
                  //     Radius.circular(10),
                  //   ),
                  // ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.kPrimary, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                )
              : InputDecoration(
                  counterText: "",
                  floatingLabelBehavior: widget.floatingLabelBehavior,
                  isDense: true,
                  labelText: widget.labelText,
                  filled: true,
                  fillColor: widget.fillColor ?? Colors.white,
                  hintText: widget.hintText,
                  alignLabelWithHint: true,
                  errorText:
                      widget.textError == null || widget.textError!.isEmpty
                          ? null
                          : widget.textError,
                  hintStyle: TextStyle(
                      color: AppColor.kPrimary.withOpacity(0.5), fontSize: 15),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  suffixIcon: widget.suffixIcon ??
                      (widget.showClear && widget.controller.text.isNotEmpty
                          ? IconButton(
                              onPressed: widget.onClear ??
                                  () {
                                    widget.controller.clear();
                                    setState(() {});
                                  },
                              icon: const Icon(
                                Icons.close,
                                size: 24,
                              ))
                          : null),
                  prefixIcon: widget.prefixIcon,
                  errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 0.5),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColor.kPrimary, width: 0.5),
                  ),
                  border: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColor.kPrimary, width: 0.5),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColor.kPrimary, width: 0.5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColor.kPrimary, width: 0.5),
                  ),
                ),
          textInputAction: widget.textInputAction ?? TextInputAction.done,
          onEditingComplete: widget.onEditingComplete,
          onChanged: (value) {
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
            setState(() {});
          },
          validator: widget.validator),
    );
  }
}
