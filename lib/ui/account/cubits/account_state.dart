part of 'account_cubit.dart';

class AccountState extends Equatable {
  final LoadStatus status;
  final AccountModel? account;
  final String? message;

  bool get hasMessage => message != null && message != '';

  bool get isLoading => status == LoadStatus.loading;

  const AccountState._({
    this.status = LoadStatus.none,
    this.account,
    this.message = '',
  });

  const AccountState.loading() : this._(status: LoadStatus.loading);

  const AccountState.failure({
    required String message,
  }) : this._(
          status: LoadStatus.failure,
          message: message,
        );

  const AccountState.loaded({
    required AccountModel account,
  }) : this._(
          status: LoadStatus.none,
          account: account,
        );

  const AccountState.created({
    required AccountModel account,
  }) : this._(
          status: LoadStatus.success,
          account: account,
        );

  @override
  List<Object?> get props => [];
}
