import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/model/deal_model.dart';
import '../../../../../core/themes/colors.dart';
import '../../../../../core/themes/ui_scales.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/cached_image_widget.dart';
import '../../controller/deal_cubit.dart';

class HeaderSlider extends StatefulWidget {
  const HeaderSlider({
    this.hasBack = true,
    super.key});

  final bool hasBack;

  @override
  State<HeaderSlider> createState() => _HeaderSliderState();
}

class _HeaderSliderState extends State<HeaderSlider> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealCubit, DealState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: UIScales.headerImageHeight,
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  _ImagesSlider(
                    pictures: state.deal!.pictures!,
                    onPageChanged: (index, reason) =>
                        setState(() {
                          this.index = index;
                        }),
                  ),
                  if(widget.hasBack) const CircularBackButton(),
                  _DotsIndicator(
                    index: index,
                    pictures: state.deal!.pictures!,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _DotsIndicator extends StatelessWidget {
  const _DotsIndicator({
    required this.index,
    required this.pictures,
  });

  final int index;
  final Pictures pictures;

  @override
  Widget build(BuildContext context) {
    if(pictures.files.length == 1) return const SizedBox.shrink();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0,),
        child: DotsIndicator(
          dotsCount: pictures.count,
          position: index,
          decorator: DotsDecorator(
            color: const Color(0xFFAFB0B1),
            spacing: const EdgeInsets.all(3),
            size: const Size(
              10,
              10,
            ),
            activeColor: AppColors.white,
            activeSize: const Size(32.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
    );
  }
}

class _ImagesSlider extends StatelessWidget {
  const _ImagesSlider({
    required this.pictures,
    this.onPageChanged,
  });

  final Function(int, CarouselPageChangedReason)? onPageChanged;
  final Pictures pictures;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        scrollPhysics: pictures.files.length == 1? const NeverScrollableScrollPhysics() : null,
        height: UIScales.headerImageHeight,
        viewportFraction: 1,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: pictures.files.length != 1,
        pageSnapping: true,
        onPageChanged: onPageChanged,
      ),
      items: pictures.files
          .map(
            (e) =>
                CachedImageWidget(
              imageUrl: e.pictureUrl,
            ),
          )
          .toList(),
    );
  }
}


