import 'package:shopping2/domain/account/models/authenticated_account_model.dart';

class CreateAccountModel extends AuthenticatedAccountModel {
  String? name;
  String? email;

  CreateAccountModel({this.name, this.email});
}
