import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/model/deal_model.dart';
import '../../../../core/enum/deal_status.dart';
import '../data/repo/deal_repo.dart';

part 'deal_state.dart';

class DealCubit extends Cubit<DealState> {
  final DealRepo dealRepo;
  final String dealId;
  final DealStatus dealStatus;

  DealCubit({
    required this.dealRepo,
    required this.dealId,
    required this.dealStatus,
  }) : super(const DealState()) {
    getDeal();
  }

  static DealCubit of(context) => BlocProvider.of<DealCubit>(context);

  Future<void> getDeal() async {
    emit(state.copyWith(loading: true));
    try {
      final Deal deal = await dealRepo.getDeal(dealId);
      emit(
        state.copyWith(
          loading: false,
          deal: deal,
          dealStatus: dealStatus,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          loading: false,
        ),
      );
    }
  }
}
