part of 'deal_cubit.dart';

class DealState {
  final bool loading;
  final Deal? deal;
  final DealStatus dealStatus;

  const DealState({
    this.loading = false,
    this.dealStatus = DealStatus.active,
    this.deal,
  });

  DealState copyWith({
    bool? loading,
    Deal? deal,
    DealStatus? dealStatus,
  }) {
    return DealState(
      loading: loading ?? this.loading,
      deal: deal ?? this.deal,
      dealStatus: dealStatus ?? this.dealStatus,
    );
  }
}

