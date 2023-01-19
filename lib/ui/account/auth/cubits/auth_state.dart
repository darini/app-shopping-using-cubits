part of 'auth_cubit.dart';

enum AuthStatus { unauthenticated, authenticated }

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final AuthenticatedAccountModel? account;
  final LoadStatus status;
  final String? message;

  bool get isAuthenticated => authStatus == AuthStatus.authenticated;

  bool get isLoading => status == LoadStatus.loading;

  bool get hasMessage => message != null && message != '';

  const AuthState._({
    this.authStatus = AuthStatus.unauthenticated,
    this.account,
    this.status = LoadStatus.loading,
    this.message,
  });

  const AuthState.authenticated({
    required AccountModel account,
    required String welcomeMessage,
  }) : this._(
          authStatus: AuthStatus.authenticated,
          account: account,
          status: LoadStatus.success,
          message: welcomeMessage,
        );

  const AuthState.unauthenticated({
    required String message,
  }) : this._(status: LoadStatus.failure, message: message);

  @override
  List<Object?> get props => [authStatus, account, status];
}
