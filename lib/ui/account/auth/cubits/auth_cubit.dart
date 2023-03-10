import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping2/domain/account/models/account_model.dart';
import 'package:shopping2/domain/account/models/authenticated_account_model.dart';
import 'package:shopping2/domain/account/repositories/account_repository_interface.dart';
import 'package:shopping2/ui/account/cubits/account_cubit.dart';
import 'package:shopping2/ui/app/enums/enums.dart';
import 'package:shopping2/ui/cart/cubits/cart_cubit.dart';

part 'auth_state.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final IAccountRepository _accountRepository;
  final CartCubit _cartCubit;
  final AccountCubit _accountCubit;

  AuthCubit(this._accountRepository, this._accountCubit, this._cartCubit)
      : super(const AuthState._());

  authenticate(AuthenticatedAccountModel account) async {
    emit(const AuthState.loading());

    try {
      var prefs = await SharedPreferences.getInstance();

      AccountModel accountAuthenticated =
          await _accountRepository.authenticate(account);

      if (accountAuthenticated.id != null) {
        _accountCubit.loadAccount(accountAuthenticated);

        await prefs.setString('account', jsonEncode(accountAuthenticated));

        String welcomeMessage = _cartCubit.state.data.isEmpty
            ? 'Bem vindo ${accountAuthenticated.name}, seu carrinho está vazio, que tal adicionar alguns itens?'
            : 'Bem vindo ${accountAuthenticated.name}, finalize sua compra para aproveitar os seus produtos :)';

        emit(
          AuthState.authenticated(
              account: accountAuthenticated, welcomeMessage: welcomeMessage),
        );
      } else {
        emit(
          const AuthState.unauthenticated(
            message: 'Login ou senha inválidos',
          ),
        );
      }
      return true;
    } catch (ex) {
      emit(
        const AuthState.unauthenticated(
          message: 'Login ou senha inválidos',
        ),
      );
      return false;
    }
  }

  loadAccount() async {
    var prefs = await SharedPreferences.getInstance();

    String? accountPreferences = prefs.getString('account');

    if (accountPreferences != null) {
      AccountModel? account =
          AccountModel.fromJson(jsonDecode(accountPreferences));

      emit(
        AuthState.authenticated(
            account: account,
            welcomeMessage:
                'Bem vindo ${account.name}, seu carrinho está vazio, que tal adicionar alguns itens?'),
      );
      _accountCubit.loadAccount(account);
    }
  }

  logout() async {
    var prefs = await SharedPreferences.getInstance();

    _accountCubit.clearAccount();
    prefs.remove('account');
    emit(const AuthState._());
  }
}
