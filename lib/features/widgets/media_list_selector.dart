import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';
import 'custom_text.dart';
import 'loader.dart';

class MediaListSelector extends StatelessWidget {
  const MediaListSelector({
    this.label = '',
    this.required = false,
    this.optional = false,
    this.load = false,
    this.pickedImage = const [],
    this.images = const [],
    this.onTap,
    this.onDeletePicked,
    this.onDeleteImage,
    super.key,
  });

  final String label;
  final bool required;
  final bool optional;
  final bool load;
  final List<File> pickedImage;
  final List<String> images;
  final Function()? onTap;
  final Function(int index)? onDeletePicked;
  final Function(int index)? onDeleteImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty)
            Row(
              children: [
                CustomText.regular(
                  label,
                  fontSize: 18.0,
                ),
                const SizedBox(
                  width: 2,
                ),
                if(required) CustomText.semiBold(
                  '*',
                  fontSize: 16.0,
                  color: AppColors.red,
                ),
                if(optional) CustomText.regular(
                  '(Optional)',
                  fontSize: 14.0,
                ),
              ],
            ),
          if (label.isNotEmpty)
            const SizedBox(
              height: 8.0,
            ),
          Row(
            children: [
              const SizedBox(width: 2,),
              DottedBorder(
                borderType: BorderType.Circle,
                dashPattern: const [8, 4],
                color: AppColors.baseColor,
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: load
                        ? const Loader()
                        : const Icon(
                            Icons.add_rounded,
                            size: 40,
                            color: AppColors.baseColor,
                          ),
                  ),
                ),
              ),
              const SizedBox(width: 8,),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      if(pickedImage.isNotEmpty) SizedBox(
                        height: 70,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => _ImageItem(
                              onTap: onDeletePicked != null
                                  ? () => onDeletePicked!(index)
                                  : null,
                              image: FileImage(pickedImage[index]),
                            ),
                            separatorBuilder: (context, index) => const SizedBox(
                            width: 8,
                          ),
                          itemCount: pickedImage.length,
                        ),
                      ),
                      if(images.isNotEmpty) SizedBox(
                        height: 70,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => _ImageItem(
                              onTap: onDeleteImage != null
                                  ? () => onDeleteImage!(index)
                                  : null,
                              image: NetworkImage(images[index]),
                            ),
                            separatorBuilder: (context, index) => const SizedBox(
                            width: 8,
                          ),
                          itemCount: images.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ImageItem extends StatelessWidget {
  const _ImageItem({
    required this.onTap,
    required this.image,
    });

  final Function()? onTap;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: image,
          ),
          Container(
            width: 21,
            height: 21,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: OvalBorder(),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
            child: const Icon(
              Icons.delete_forever_outlined,
              size: 16,
              color: AppColors.red,
            ),
          ),
        ],
      ),
    );
  }
}

