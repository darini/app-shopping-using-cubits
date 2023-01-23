import 'package:shopping2/domain/account/models/account_model.dart';
import 'package:shopping2/domain/account/models/authenticated_account_model.dart';
import 'package:shopping2/domain/account/models/create_account_model.dart';

abstract class IAccountRepository {
  Future<AccountModel> authenticate(AuthenticatedAccountModel account);
  Future<AccountModel> create(CreateAccountModel account);
}
