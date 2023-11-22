import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyaltty_customer/core/data/model/business_model.dart';
import 'package:loyaltty_customer/features/main_feature/retailer/data/repo/retailer_repo.dart';
import 'package:loyaltty_customer/features/widgets/custom_snack_bar.dart';

import '../../../../core/data/repo/deal_redemption_repo.dart';
import '../../../../core/themes/colors.dart';

part 'retailer_state.dart';

class RetailerCubit extends Cubit<RetailerState> {
  RetailerCubit({
    required this.businessId,
    required this.retailerRepo,
    required this.dealRepo,
  }) : super(
          RetailerState(
            businessId: businessId,
          ),
        );

  static RetailerCubit of(BuildContext context) =>
      BlocProvider.of<RetailerCubit>(context);
  final RetailerRepo retailerRepo;
  final DealRedemptionRepo dealRepo;
  final String businessId;
  ConfettiController? confettiController;

  confettiPlay() async{
    confettiController = ConfettiController();
    confettiController!.play();
    Timer(
      const Duration(seconds: 10),
          () => confettiController!.stop(),
    );
  }

  Future<void> getRetailer() async {
    emit(state.copyWith(loading: true));
    try{
      final Business business = await retailerRepo.getRetailer(businessId);
      emit(state.copyWith(
        business: business,
        loading: false,
      ));
    } catch(e){
      emit(state.copyWith(
        loading: false,
      ));
    }
  }

  Future<void> requestStamp() async {
    emit(state.copyWith(stampLoading: true));
    try{
      final rewardId = state.business!.rewardProgram!.id;
      final Business business = await retailerRepo.requestStamp(
        businessId,
        rewardId!,
      );
      showSnackBar(
        'Stamp requested successfully',
        snackBarColor: AppColors.green,
      );
      emit(state.copyWith(
        business: business,
        stampLoading: false,
      ));
    } catch(e){
      emit(state.copyWith(
        stampLoading: false,
      ));
    }
  }

  Future<void> redeemReward() async {
    emit(state.copyWith(redeemLoading: true));
    try{
      final rewardId = state.business!.rewardProgram!.id;
      final Business business = await retailerRepo.redeemReward(
        businessId,
        rewardId!,
      );
      emit(state.copyWith(
        business: business,
        redeemLoading: false,
      ));
    } catch(e){
      emit(state.copyWith(
        redeemLoading: false,
      ));
    }
  }

  Future<void> redeemDeal(int index) async {
    emit(state.copyWith(dealRedeemLoading: true, dealRedeemIndex: index));
    final dealId = int.parse(state.business!.deals[index].id);
    try{
      await dealRepo.redeemSingleDeal(
        dealId,
      );
      showSnackBar(
        'Deal redeemed successfully',
        snackBarColor: AppColors.green,
      );
      emit(state.copyWith(
        dealRedeemLoading: false,
        dealRedeemIndex: -1,
      ));
    } on DioException catch(e){
      final error = e.response!.data['message'];
      if(error != null){
        showSnackBar(
          error,
          textColor: Colors.black,
          snackBarColor: Colors.yellowAccent,
        );
      }
      emit(state.copyWith(
        dealRedeemLoading: false,
        dealRedeemIndex: -1,
      ));
    }
  }

  Future<void> redeemMultipleDeals() async {
    emit(state.copyWith(multipleDealRedeemLoading: true,));
    final dealsId = state.selectedDeals;
    try{
      await dealRepo.redeemMultipleDeal(
        dealsId,
      );
      showSnackBar(
        'Deals redeemed successfully',
        snackBarColor: AppColors.green,
      );
      emit(state.copyWith(
        multipleDealRedeemLoading: false,
      ));
    } on DioException catch(e){
      final error = e.response!.data['message'];
      if(error != null){
        showSnackBar(
          error,
          textColor: Colors.black,
          snackBarColor: Colors.yellowAccent,
        );
      }
      emit(state.copyWith(
        dealRedeemLoading: false,
        dealRedeemIndex: -1,
      ));
    }
  }

  void enableSelection() {
    final select = !state.enableSelection;
    emit(
      state.copyWith(
        enableSelection: select,
        selectedDeals: [],
      ),
    );
  }

  void selectDeal(String dealId) {
    int id = int.parse(dealId);
    final selectedDeals = state.selectedDeals;
    if(selectedDeals.contains(id)){
      selectedDeals.remove(id);
    } else {
      selectedDeals.add(id);
    }
    emit(
      state.copyWith(
        selectedDeals: selectedDeals,
      ),
    );
  }

  void selectAllDeals() {
    List<int> selectedDeals = [];
    selectedDeals = state.business!.deals.map((e) => int.parse(e.id)).toList();
    emit(
      state.copyWith(
        selectedDeals: selectedDeals,
      ),
    );
  }

  @override
  Future<void> close() {
    confettiController!.dispose();
    return super.close();
  }
}
