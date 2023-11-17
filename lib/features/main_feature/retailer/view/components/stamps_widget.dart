import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyaltty_customer/features/main_feature/retailer/controller/retailer_cubit.dart';
import 'package:loyaltty_customer/features/widgets/base_button.dart';
import 'package:loyaltty_customer/features/widgets/custom_text_button.dart';
import 'package:loyaltty_customer/features/widgets/info_dialog.dart';
import 'package:loyaltty_customer/features/widgets/padding_column.dart';

import '../../../../../core/themes/ui_scales.dart';
import '../../../../../generated/assets.dart';

class StampsWidget extends StatelessWidget {
  const StampsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RetailerCubit, RetailerState>(
      builder: (context, state) {
        var cubit = RetailerCubit.of(context);

        return PaddingColumn(
          paddingType:
              const EdgeInsets.symmetric(horizontal: UIScales.paddingValue),
          children: [
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'You need 3 more stamps to get your next reward \n',
                    style: TextStyle(
                      color: Color(0xBA08081D),
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: 'Expiry date before reset : 11/11/2023',
                    style: TextStyle(
                      color: Color(0xBA08081D),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(UIScales.paddingValue),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: GridView.builder(
                itemCount: 18,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 9,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) => Opacity(
                  opacity: index + 1 <= 2 ? 1 : 0.5,
                  child: Image.asset(Assets.stamp),
                ),
              ),
            ),
            const SizedBox(
              height: UIScales.paddingValue,
            ),
            CustomTextButton(
              buttonText: 'Terms and Conditions',
              isUnderLine: true,
              onTap: () => showDialog(
                context: context,
                builder: (_) => InfoDialog(
                  title: 'Terms and Conditions',
                  body: termsAndConditions,
                ),
              ),
            ),
            const SizedBox(
              height: UIScales.paddingValue,
            ),
            BaseButton(
              buttonText: 'Get Stamps',
              onTap: cubit.requestStamp,
              loading: state.stampLoading || state.redeemLoading,
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        );
      },
    );
  }

  final String termsAndConditions = '''
a. Earn at least 1 stamp for every visit
b. Collect #(point 3) stamps to get your reward
c. Stamps and rewards can't be transferred, redeemed for cash, or refunded
d. The reward may change to the active reward on the day of redemption
e. We reserve the right to change, cancel or deny the reward
          ''';
}
