import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping2/domain/account/models/create_account_model.dart';
import 'package:shopping2/domain/account/models/authenticated_account_model.dart';
import 'package:shopping2/domain/account/models/account_model.dart';
import 'package:shopping2/domain/account/repositories/account_repository_interface.dart';
import 'package:shopping2/util/constants.dart';

@LazySingleton(as: IAccountRepository)
class AccountRepository implements IAccountRepository {
  @override
  Future<AccountModel> authenticate(AuthenticatedAccountModel account) async {
    var url = '${apiUrl}v1/account/login';
    AccountModel accountAuthenticated = AccountModel();

    try {
      Response response = await Dio().post(url, data: account.toJson());

      return AccountModel.fromJson(response.data);
    } catch (ex) {
      return accountAuthenticated;
    }
  }

  @override
  Future<AccountModel> create(CreateAccountModel account) async {
    var url = '${apiUrl}v1/account';

    AccountModel accountCreated = AccountModel();
    try {
      Response response = await Dio().post(url, data: account.toJson());

      return AccountModel.fromJson(response.data);
    } catch (ex) {
      return accountCreated;
    }
  }
}
