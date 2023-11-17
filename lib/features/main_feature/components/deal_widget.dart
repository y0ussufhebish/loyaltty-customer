import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:loyaltty_customer/core/themes/colors.dart';
import 'package:loyaltty_customer/features/main_feature/retailer/controller/retailer_cubit.dart';
import 'package:loyaltty_customer/features/widgets/base_button.dart';
import 'package:loyaltty_customer/features/widgets/cached_image_widget.dart';
import 'package:loyaltty_customer/features/widgets/custom_text.dart';

class DealWidget extends StatelessWidget {
  const DealWidget({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RetailerCubit, RetailerState>(
      builder: (context, state) {
        
        var cubit = RetailerCubit.of(context);
        
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          constraints: const BoxConstraints(
            minWidth: 300,
          ),
          height: 190,
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x23000000),
                blurRadius: 4,
                offset: Offset(0, 0),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              const CachedImageWidget(
                imageUrl: 'https://picsum.photos/200/300',
                borderRadius: 14,
                width: 120,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.bold(
                      'Deal Widget',
                      fontSize: 21,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      height: 1.2,
                    ),
                    const SizedBox(height: 4,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HeroIcon(
                          HeroIcons.clock,
                          size: 20,
                          style: HeroIconStyle.solid,
                          color: const Color(0xff08081d).withOpacity(0.73),
                        ),
                        const SizedBox(width: 4,),
                        CustomText.regular(
                          'Expires in 2 days',
                          fontSize: 14,
                          color: const Color(0xff08081d).withOpacity(0.73),
                          height: 1.5,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4,),
                    CustomText.bold(
                      'Deal Value: \$20',
                      fontSize: 16,
                      color: AppColors.baseColor,
                    ),
                    const SizedBox(height: 4,),
                    Expanded(
                      child: CustomText.regular(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
                        fontSize: 14,
                        textAlign: TextAlign.start,
                        color: const Color(0xBA08081D),
                        maxLines: 3,
                      ),
                    ),
                    BaseButton(
                      buttonText: 'Redeem',
                      width: 100,
                      onTap: () => cubit.redeemDeal(index),
                      loading: state.dealRedeemLoading && state.dealRedeemIndex == index,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
