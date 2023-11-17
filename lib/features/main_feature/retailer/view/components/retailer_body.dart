import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyaltty_customer/features/main_feature/retailer/controller/retailer_cubit.dart';
import 'package:loyaltty_customer/features/main_feature/retailer/view/components/retailer_header.dart';
import 'package:loyaltty_customer/features/main_feature/retailer/view/components/stamps_widget.dart';
import 'package:loyaltty_customer/features/widgets/loader.dart';
import 'deals_list.dart';

class RetailerBody extends StatefulWidget {
  const RetailerBody({super.key});

  @override
  State<RetailerBody> createState() => _RetailerBodyState();
}

class _RetailerBodyState extends State<RetailerBody> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RetailerCubit, RetailerState>(
      builder: (context, state) {
        var cubit = RetailerCubit.of(context);

        if(state.loading) return const Loader();

        return Stack(
          alignment: Alignment.topCenter,
          children: [
            const SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RetailerHeader(),
                    StampsWidget(),
                    DealsList(),
                  ],
                ),
              ),
            ),
            if(cubit.confettiController != null) ConfettiWidget(
              confettiController: cubit.confettiController!,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: true,
              gravity: 0.4,
              numberOfParticles: 20,
            ),
          ],
        );
      },
    );
  }
}
