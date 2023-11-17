import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/sizer.dart';
import '../../../../../core/themes/colors.dart';
import '../../../../../core/themes/ui_scales.dart';
import '../../../../widgets/padding_column.dart';
import '../../controller/deal_cubit.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealCubit, DealState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: PaddingColumn(
            padding: 0,
            children: [
              const SizedBox(
                height: 45,
                child: TabBar(
                  indicatorWeight: 4,
                  indicatorColor: AppColors.baseColor,
                  dividerColor: Colors.transparent,
                  labelColor: AppColors.baseColor,
                  labelStyle: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 18,
                  ),
                  tabs: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Tab(
                        text: 'Full Details',
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Tab(
                        text: 'Terms & Conditions',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: SizerHelper.h(100) - (320 + UIScales.headerImageHeight),
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Text(
                        state.deal!.fullDetails,
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.2,
                          color: const Color(0xFF08081D).withOpacity(0.7),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Text(
                        state.deal!.termsAndConditions,
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.2,
                          color: const Color(0xFF08081D).withOpacity(0.7),
                        ),
                      ),
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

const testString = 'Lorem ipsum dolor sit amet consectetur. Consectetur velit dignissim pharetra turpis sem ut enim duis. Sociis tristique dolor cursus montes urna sed turpis pellentesque. Nunc facilisis tellus in interdum massa. Eget hendrerit risus in pretium sit egestas. Lorem ipsum dolor sit amet consectetur. Consectetur velit dignissim pharetra turpis sem ut enim duis. Sociis tristique dolor cursus montes urna sed turpis pellentesque. Nunc facilisis tellus in interdum massa. Eget hendrerit risus in pretium sit egestas. Lorem ipsum dolor sit amet consectetur. Consectetur velit dignissim pharetra turpis sem ut enim duis. Sociis tristique dolor cursus montes urna sed turpis pellentesque. Nunc facilisis tellus in interdum massa. Eget hendrerit risus in pretium sit egestas.';
