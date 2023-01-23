import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping2/domain/account/models/account_model.dart';
import 'package:shopping2/domain/account/models/create_account_model.dart';
import 'package:shopping2/domain/account/repositories/account_repository_interface.dart';
import 'package:shopping2/ui/app/enums/enums.dart';

part 'account_state.dart';

@singleton
class AccountCubit extends Cubit<AccountState> {
  final IAccountRepository _accountRepository;

  AccountCubit(this._accountRepository) : super(const AccountState._());

  void loadAccount(AccountModel accountModel) {
    emit(AccountState.loaded(account: accountModel));
  }

  void createAccount(CreateAccountModel account) async {
    emit(
      const AccountState.loading(),
    );

    AccountModel accountCreated = await _accountRepository.create(account);

    emit(
      AccountState.created(account: accountCreated),
    );
  }

  void clearAccount() {
    emit(
      const AccountState.initial(),
    );
  }
}
