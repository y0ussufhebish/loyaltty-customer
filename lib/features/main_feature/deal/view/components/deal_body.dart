import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../../core/helpers/sizer.dart';
import '../../../../../core/themes/colors.dart';
import '../../../../../core/themes/ui_scales.dart';
import '../../../../widgets/base_button.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/loader.dart';
import '../../../../widgets/padding_column.dart';
import '../../controller/deal_cubit.dart';
import 'deal_header.dart';
import 'deatails_widget.dart';
import 'header_slider.dart';


class DealBody extends StatelessWidget {
  const DealBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealCubit, DealState>(
      builder: (context, state) {
        if (state.loading) return const Loader();

        if (state.deal == null) return const _ErrorWidget();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const HeaderSlider(),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: UIScales.paddingValue,
              ).copyWith(
                top: UIScales.paddingValue,
              ),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const PaddingColumn(
                paddingType: EdgeInsets.all(10),
                children: [
                  DealHeader(),
                  DetailsWidget(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealCubit, DealState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: UIScales.paddingValue,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HeroIcon(
                HeroIcons.exclamationTriangle,
                size: 100,
                color: AppColors.baseColor,
              ),
              SizedBox(
                width: SizerHelper.w(75),
                child: CustomText.regular(
                  'There\'s a problem getting the deal, please try again later',
                  maxLines: 3,
                  height: 1.5,
                ),
              ),
              const SizedBox(
                height: UIScales.paddingValue,
                width: double.infinity,
              ),
              Row(
                children: [
                  Expanded(
                    child: BaseButton(
                      buttonText: 'Try Again',
                      onTap: () => DealCubit.of(context).getDeal(),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: BaseButton(
                      buttonText: 'Go Back',
                      onTap: () => Navigator.pop(context),
                      isOutLine: true,
                      textColor: AppColors.baseColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

