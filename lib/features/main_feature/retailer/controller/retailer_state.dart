part of 'retailer_cubit.dart';

class RetailerState {
  final Business? business;
  final String businessId;
  final List<int> selectedDeals;
  final int dealRedeemIndex;
  final bool loading;
  final bool stampLoading;
  final bool redeemLoading;
  final bool dealRedeemLoading;
  final bool multipleDealRedeemLoading;
  final bool enableSelection;

  const RetailerState({
    required this.businessId,
    this.business,
    this.selectedDeals = const [],
    this.dealRedeemIndex = -1,
    this.loading = false,
    this.stampLoading = false,
    this.redeemLoading = false,
    this.dealRedeemLoading = false,
    this.multipleDealRedeemLoading = false,
    this.enableSelection = false,
  });

  RetailerState copyWith({
    Business? business,
    String? businessId,
    List<int>? selectedDeals,
    int? dealRedeemIndex,
    bool? loading,
    bool? stampLoading,
    bool? redeemLoading,
    bool? dealRedeemLoading,
    bool? multipleDealRedeemLoading,
    bool? enableSelection,
  }) {
    return RetailerState(
      businessId: businessId ?? this.businessId,
      business: business ?? this.business,
      selectedDeals: selectedDeals ?? this.selectedDeals,
      dealRedeemIndex: dealRedeemIndex ?? this.dealRedeemIndex,
      loading: loading ?? this.loading,
      stampLoading: stampLoading ?? this.stampLoading,
      redeemLoading: redeemLoading ?? this.redeemLoading,
      dealRedeemLoading: dealRedeemLoading ?? this.dealRedeemLoading,
      multipleDealRedeemLoading:
          multipleDealRedeemLoading ?? this.multipleDealRedeemLoading,
      enableSelection: enableSelection ?? this.enableSelection,
    );
  }
}
