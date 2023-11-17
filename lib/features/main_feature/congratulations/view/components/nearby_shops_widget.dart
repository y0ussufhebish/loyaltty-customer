import 'package:flutter/material.dart';
import 'package:loyaltty_customer/core/themes/ui_scales.dart';
import 'package:loyaltty_customer/features/widgets/custom_text.dart';

class NearbyShopsWidget extends StatelessWidget {
  const NearbyShopsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.bold(
          'Nearby stores with good deals',
          fontSize: 20,
        ),
        const SizedBox(
          height: 8,
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 190 / 107,
            crossAxisSpacing: UIScales.paddingValue,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (_, index) => const _ShopWidget(),
          itemCount: 20,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}

class _ShopWidget extends StatelessWidget {
  const _ShopWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 190,
      height: 107,
      decoration: ShapeDecoration(
        color: const Color(0xFFF1F9F9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x23000000),
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 52,
            height: 53,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage("https://via.placeholder.com/52x53"),
                fit: BoxFit.fill,
              ),
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
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'restaurant',
                        style: TextStyle(
                          color: Color(0xFF07081C),
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

