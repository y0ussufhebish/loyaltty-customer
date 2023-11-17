import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/sizer.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/welcome_deal_widget.dart';
import '../../controller/deal_cubit.dart';

class DealHeader extends StatelessWidget {
  const DealHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealCubit, DealState>(
      builder: (context, state) {
        return SizedBox(
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: SizerHelper.w(50),
                    ),
                    child: CustomText.bold(
                      state.deal!.name,
                      textAlign: TextAlign.start,
                      height: 1.2,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 4.5,
                        backgroundColor: state.dealStatus.statusColor,
                      ),
                      const SizedBox(width: 4,),
                      CustomText.regular(
                        state.dealStatus.name,
                        fontSize: 18,
                        height: 1.5,
                        color: state.dealStatus.statusColor,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8,),
              if(state.deal!.startDateFormatted().isNotEmpty && state.deal!.startDateFormatted().isNotEmpty)Row(
                children: [
                  Icon(
                    Icons.access_time_filled_rounded,
                    // size: 18,
                    color: const Color(0xff08081D).withOpacity(0.7),
                  ),
                  const SizedBox(width: 6,),
                  CustomText.regular(
                    'From ',
                    fontSize: 18,
                    color: const Color(0xff08081D).withOpacity(0.7),
                    height: 1.5,
                  ),
                  CustomText.regular(
                    '${state.deal!.startDateFormatted()} - ${state.deal!.endDateFormatted()}',
                    fontSize: 18,
                    color: const Color(0xff08081D),
                    height: 1.5,
                  ),
                ],
              ),
              const SizedBox(height: 8,),
              Row(
                children: [
                  CustomText.bold('\$${state.deal!.price}', fontSize: 35,),
                  const Spacer(),
                  if (state.deal!.type == 'welcome')
                    WelcomeDealWidget(
                      backgroundColor: Colors.white.withOpacity(0.5),
                    ),
                ],
              ),
              const SizedBox(height: 10,),
            ],
          ),
        );
      },
    );
  }
}
