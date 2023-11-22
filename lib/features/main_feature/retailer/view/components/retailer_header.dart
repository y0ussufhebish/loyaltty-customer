import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../core/themes/colors.dart';
import '../../../../../generated/assets.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/padding_column.dart';
import '../../controller/retailer_cubit.dart';

class RetailerHeader extends StatelessWidget {
  const RetailerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RetailerCubit, RetailerState>(
      builder: (context, state) {

        if(state.business == null) return const SizedBox.shrink();

        return PaddingColumn(
          children: [
            CustomText.bold(
              'Welcome Back, Client!',
              fontSize: 25,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: QrImageView(
                data: 'dklfjdsf',
                backgroundColor: AppColors.white,
                size: 200,
                embeddedImage: const AssetImage(Assets.logoQr),
                embeddedImageStyle: const QrEmbeddedImageStyle(
                  size: Size(60, 25),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/60x60"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                    color: Color(0xfff2f2f2),
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
                const SizedBox(width: 8,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.bold(
                      state.business!.name,
                      fontSize: 21,
                    ),
                    // CustomText.regular(
                    //   'Wade Warren',
                    //   fontSize: 14,
                    // ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
