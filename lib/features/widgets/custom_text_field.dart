import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/themes/colors.dart';
import 'custom_text.dart';

class CustomTextFormFiled extends StatefulWidget {
  const CustomTextFormFiled({
    required this.controller,
    this.hint = '',
    this.label = '',
    this.maxLines = 1,
    this.padding = 10.0,
    this.overallPadding = 8.0,
    this.width,
    this.textInputType = TextInputType.emailAddress,
    this.textInputAction = TextInputAction.next,
    this.enabled = true,
    this.required = false,
    this.optional = false,
    this.isPassword = false,
    this.isPhone = false,
    this.passwordRules = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onSaved,
    this.onFieldSubmitted,
    this.onTap,
    this.validator,
    this.inputFormatters,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final String label;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final int maxLines;
  final double? width;
  final double padding;
  final bool enabled;
  final bool required;
  final bool optional;
  final bool isPhone;
  final bool isPassword;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String?)? onSaved;
  final Function(String?)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final double overallPadding;
  final List<TextInputFormatter>? inputFormatters;
  final bool passwordRules;

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  bool obscured = true;
  bool focused = false;
  String? validationText;
  final FocusNode _focusNode = FocusNode();

  List<String> passwordValidation = [
    'At least 8 characters',
    'At least 1 uppercase letter & 1 lowercase letter',
    'At least 1 number',
    'At least 1 special character like (!@#\$%^&*,.)',
  ];

  List<bool> passwordValidationChecked = [
    false,
    false,
    false,
    false,
  ];


  @override
  void initState() {
    _focusNode.addListener(() {
      if(focused) return;
      if (_focusNode.hasFocus) {
        setState(() {
          focused = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: widget.overallPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label.isNotEmpty)
            Row(
              children: [
                CustomText.regular(
                  widget.label,
                  fontSize: 16,
                ),
                const SizedBox(
                  width: 2,
                ),
                if(widget.required) CustomText.semiBold(
                  '*',
                  fontSize: 16.0,
                  color: AppColors.red,
                ),
                if(widget.optional) CustomText.regular(
                  '(Optional)',
                  fontSize: 12.0,
                ),
              ],
            ),
          if (widget.label.isNotEmpty)
            const SizedBox(
              height: 8.0,
            ),
          SizedBox(
            width: widget.width,
            child: InkWell(
              onTap: widget.onTap,
              child: TextFormField(
                focusNode: _focusNode,
                onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                /// CONTROLLER
                controller: widget.controller,

                /// VALIDATOR
                validator: widget.passwordRules
                    ? (value) {
                        final capRegex = RegExp(r'[A-Z]');
                        final smallRegex = RegExp(r'[a-z]');
                        final numRegex = RegExp(r'[0-9]');
                        final specialRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
                        passwordValidationChecked[0] = value!.length >= 8;
                        passwordValidationChecked[1] =
                            capRegex.hasMatch(value) &&
                                smallRegex.hasMatch(value);
                        passwordValidationChecked[2] = numRegex.hasMatch(value);
                        passwordValidationChecked[3] =
                            specialRegex.hasMatch(value);
                        Future.delayed(Duration.zero, () {
                          setState(() {
                          });
                        });
                        if (passwordValidationChecked.contains(false)) {
                          validationText = '';
                          return '';
                        }
                        validationText = null;
                        return null;
                      }
                    : widget.validator,
                autovalidateMode: AutovalidateMode.onUserInteraction,

                /// OBSCURE
                obscureText: widget.isPassword ? obscured : false,

                /// KEYBOARD TYPE ..
                keyboardType: widget.isPhone
                    ? TextInputType.phone
                    : widget.textInputType,

                textInputAction: widget.textInputAction,

                textAlignVertical: TextAlignVertical.center,

                /// TEXT STYLE ..
                style: TextStyle(
                  fontSize: 16.0 / MediaQuery.of(context).textScaleFactor,
                  color: AppColors.baseColor,
                  height: 1.4,
                ),

                /// CURSOR
                cursorHeight: 22.0,
                cursorColor: AppColors.baseColor,

                /// MaxLines controlling
                maxLines: widget.maxLines,
                onSaved: widget.onSaved,
                onFieldSubmitted: widget.onFieldSubmitted,
                inputFormatters: widget.inputFormatters,
                ///DECORATION
                decoration: InputDecoration(
                  /// Enabling using the text field
                  enabled: widget.enabled,

                  /// PADDING ..
                  contentPadding: EdgeInsets.all(widget.padding),

                  /// HINT ..
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                    fontSize: 16.0 / MediaQuery.of(context).textScaleFactor,
                    color: AppColors.grey01,
                    height: 1.6,
                  ),
                  errorStyle: TextStyle(
                      color: AppColors.red,
                      fontSize: 10.0 / MediaQuery.of(context).textScaleFactor,
                      height: 1.0),

                  /// PREFIX & SUFFIX ** if I don't want prefix will create another one ..
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.isPassword
                      ? IconButton(
                          icon: ! obscured
                              ? const Icon(
                                  Icons.visibility_outlined,
                                  color: AppColors.grey01,
                                )
                              : const Icon(
                                  Icons.visibility_off_outlined,
                                  color: AppColors.grey01,
                                ),
                          onPressed: () {
                            setState(() {
                              obscured = !obscured;
                            });
                          },
                        )
                      : widget.suffixIcon,
                ),
              ),
            ),
          ),
          if(widget.passwordRules && focused) Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(
                height: validationText != null? 0.0 : 8.0,
              ),
              CustomText.bold(
                'Password Rules:',
                fontSize: 14.0,
                color: AppColors.black,
              ),
                ListView.separated(
                  padding: const EdgeInsets.only(top: 8),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => _PasswordRuleWidget(
                    checked: passwordValidationChecked[index],
                    text: passwordValidation[index],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 4,
                  ),
                  itemCount: passwordValidation.length,
                ),
              ],
          ),
        ],
      ),
    );
  }
}

class _PasswordRuleWidget extends StatelessWidget {
  const _PasswordRuleWidget({
    required this.checked,
    required this.text,
  });

  final bool checked;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Icon(
            checked ? Icons.check_circle : Icons.remove_circle_outline,
            key: ValueKey(checked),
            color: checked ? AppColors.green : AppColors.red,
            size: 16.0,
          ),
        ),
        const SizedBox(
          width: 4.0,
        ),
        CustomText.regular(
          text,
          fontSize: 12.0,
          height: 1.5,
          color: AppColors.black,
        ),
      ],
    );
  }
}

