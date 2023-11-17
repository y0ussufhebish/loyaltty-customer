part of 'tell_me_cubit.dart';

class TellMeState {
  final bool loginLoading;
  final bool verifyLoading;
  final bool pinCodeCompleted;
  final bool needVerify;
  final bool verified;
  final String countryCode;

  const TellMeState({
    this.loginLoading = false,
    this.verifyLoading = false,
    this.pinCodeCompleted = false,
    this.needVerify = false,
    this.verified = false,
    this.countryCode = '+1',
  });

  TellMeState copyWith({
    bool? loginLoading,
    bool? verifyLoading,
    bool? pinCodeCompleted,
    bool? needVerify,
    bool? verified,
    String? countryCode,
  }) {
    return TellMeState(
      loginLoading: loginLoading ?? this.loginLoading,
      verifyLoading: verifyLoading ?? this.verifyLoading,
      pinCodeCompleted: pinCodeCompleted ?? this.pinCodeCompleted,
      needVerify: needVerify ?? this.needVerify,
      verified: verified ?? this.verified,
      countryCode: countryCode ?? this.countryCode,
    );
  }
}
