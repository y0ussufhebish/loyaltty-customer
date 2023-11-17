part of 'retailer_cubit.dart';

class RetailerState {
  final Business? business;
  final String businessId;
  final bool loading;
  final bool stampLoading;
  final bool redeemLoading;
  final bool dealRedeemLoading;
  final int dealRedeemIndex;

  const RetailerState({
    required this.businessId,
    this.business,
    this.loading = false,
    this.stampLoading = false,
    this.redeemLoading = false,
    this.dealRedeemLoading = false,
    this.dealRedeemIndex = -1,
  });

  RetailerState copyWith({
    Business? business,
    String? businessId,
    bool? loading,
    bool? stampLoading,
    bool? redeemLoading,
    bool? dealRedeemLoading,
    int? dealRedeemIndex,
  }) {
    return RetailerState(
      businessId: businessId ?? this.businessId,
      business: business ?? this.business,
      loading: loading ?? this.loading,
      stampLoading: stampLoading ?? this.stampLoading,
      redeemLoading: redeemLoading ?? this.redeemLoading,
      dealRedeemLoading: dealRedeemLoading ?? this.dealRedeemLoading,
      dealRedeemIndex: dealRedeemIndex ?? this.dealRedeemIndex,
    );
  }
}
