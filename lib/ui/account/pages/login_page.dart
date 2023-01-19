import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping2/domain/account/models/account_model.dart';
import 'package:shopping2/domain/account/models/authenticated_account_model.dart';
import 'package:shopping2/ui/account/auth/cubits/auth_cubit.dart';
import 'package:shopping2/ui/app/widgets/loader.widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  AuthenticatedAccountModel account = AuthenticatedAccountModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Login',
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Usuário',
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Usuário inválido';
                  }
                  return null;
                },
                onSaved: (value) {
                  account.username = value!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Senha inválida';
                  }
                  return null;
                },
                onSaved: (value) {
                  account.password = value!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      context.read<AuthCubit>().authenticate(
                            account,
                          );
                      //authenticate(context);

                      //if (context.read<AuthCubit>().state.account != null) {
                      Navigator.pop(context);
                      // }
                    }
                  },
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
