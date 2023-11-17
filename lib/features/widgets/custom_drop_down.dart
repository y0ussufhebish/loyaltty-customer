import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';
import '../../core/themes/ui_scales.dart';
import 'custom_text.dart';
import 'loader.dart';

class DropDownTextField extends StatefulWidget {
  const DropDownTextField({
    super.key,
    required this.hint,
    required this.items,
    this.category,
    this.onChanged,
    this.onTap,
    this.isModel = false,
    this.icon,
    this.label = '',
    this.hasLabel = false,
    this.loading = false,
    this.type = 1,
    this.paddingHor,
    this.paddingVer,
    this.fillColor,
  });

  final List<dynamic>? items;
  final Function(dynamic)? onChanged;
  final String hint;
  final String? icon;
  final String label;
  final Function()? onTap;
  final bool isModel;
  final bool hasLabel;
  final double? paddingHor;
  final double? paddingVer;
  final Color? fillColor;
  final int type;
  final bool loading;
  final String? category;

  @override
  State<DropDownTextField> createState() => _DropDownTextFieldState();
}

class _DropDownTextFieldState extends State<DropDownTextField> {
  dynamic value;

  @override
  void initState() {
    value = widget.category;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.hasLabel && widget.label.isNotEmpty)
            CustomText.regular(
              widget.label,
              fontSize: 16,
            ),
          if (widget.hasLabel && widget.label.isNotEmpty)
            const SizedBox(
              height: 12,
            ),
          GestureDetector(
            onTap: widget.onTap,
            child: Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.lightGrey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(UIScales.formRadius),
              ),
              child: widget.loading
                  ? const Loader()
                  : DropdownButton<dynamic>(
                      value: value,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.black,
                        size: 18.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                      dropdownColor: AppColors.white,
                      iconEnabledColor: AppColors.black,
                      isExpanded: true,
                      underline: const SizedBox(height: 0),
                      hint: CustomText.regular(
                        widget.hint,
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      items: widget.items!
                          .map((e) => DropdownMenuItem<dynamic>(
                                onTap: () {
                                  setState(() {
                                    value = e.id;
                                  });
                                },
                                value: e.id,
                                child: Padding(
                                  padding: EdgeInsets.zero,
                                  child: CustomText.regular(
                                    e.name ?? "",
                                    fontSize: 14.0,
                                    height: 1.5,
                                    color: Colors.black,
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: widget.onChanged,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}


class CountryDropDownTextField extends StatefulWidget {
  const CountryDropDownTextField({
    super.key,
    required this.hint,
    required this.items,
    this.onChanged,
    this.onTap,
    this.isModel = false,
    this.icon,
    this.label = '',
    this.hasLabel = false,
    this.initialValue = 'US',
    this.type = 1,
    this.paddingHor,
    this.paddingVer,
    this.fillColor,
  });

  final List<dynamic>? items;
  final Function(dynamic)? onChanged;
  final String hint;
  final String? icon;
  final String label;
  final Function()? onTap;
  final bool isModel;
  final bool hasLabel;
  final double? paddingHor;
  final double? paddingVer;
  final Color? fillColor;
  final int type;
  final String initialValue;

  @override
  State<CountryDropDownTextField> createState() => _CountryDropDownTextFieldState();
}

class _CountryDropDownTextFieldState extends State<CountryDropDownTextField> {
  String? value;

  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.hasLabel && widget.label.isNotEmpty)
            CustomText.regular(
              widget.label,
              fontSize: 16,
            ),
          if (widget.hasLabel && widget.label.isNotEmpty)
            const SizedBox(
              height: 12,
            ),
          GestureDetector(
            onTap: widget.onTap,
            child: Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.lightGrey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(UIScales.formRadius),
              ),
              child: DropdownButton<String>(
                value: value,
                icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.black, size: 18.0,),
                borderRadius: BorderRadius.circular(12.0),
                dropdownColor: AppColors.white,
                iconEnabledColor: AppColors.black,
                isExpanded: true,
                underline: const SizedBox(height: 0),
                hint: CustomText.regular(
                  widget.hint,
                  fontSize: 14.0,
                  color:Colors.black,
                ),
                items: widget.items!.map((e) =>
                    DropdownMenuItem<String>(
                      onTap: () {
                        setState(() {
                          value = e.alpha2;
                        });
                      },
                      value: e.alpha2,
                      child: Padding(
                        padding: EdgeInsets.zero,
                        child: CustomText.regular(
                          e.isoShortName ?? "",
                          fontSize: 14.0,
                          height: 1.5,
                          color:Colors.black,
                        ),
                      ),
                    )
                ).toList(),
                onChanged: widget.onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}