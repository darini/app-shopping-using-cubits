import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping2/ui/account/auth/cubits/auth_cubit.dart';
import 'package:shopping2/ui/account/auth/widgets/authenticated_user_card.widget.dart';
import 'package:shopping2/ui/account/auth/widgets/unauthenticated_user_card.widget.dart';
import 'package:shopping2/ui/account/cubits/account_cubit.dart';
import 'package:shopping2/ui/app/enums/enums.dart';
import 'package:shopping2/ui/app/widgets/loader.widget.dart';
import 'package:shopping2/ui/app/widgets/my_snackBar.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  void showSnackBarError(String? message, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(MySackBar.error(message: message));
  }

  void showSnackBarSuccess(String? message, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(MySackBar.success(message: message));
  }

  void showSnackBarInformation(String? message, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(MySackBar.information(message: message));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (previous, current) => current.hasMessage,
          listener: (_, state) => state.status == LoadStatus.failure
              ? showSnackBarError(state.message, context)
              : showSnackBarInformation(state.message, context),
          child: Loader(
            state: context.read<AuthCubit>().state,
            callback: null,
          ),
        ),
        BlocListener<AccountCubit, AccountState>(
          listenWhen: (previous, current) => current.hasMessage,
          listener: (_, state) => state.status == LoadStatus.failure
              ? showSnackBarError(state.message, context)
              : showSnackBarInformation(state.message, context),
        ),
      ],
      child: BlocBuilder<AuthCubit, AuthState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: TextButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => ,
                  //   ),
                  // );
                },
                child: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ),
            body:
                state.isLoading || context.read<AccountCubit>().state.isLoading
                    ? Loader(
                        state: state,
                        callback: null,
                      )
                    : (state.isAuthenticated
                        ? const AuthenticatedUserCard()
                        : const UnauthenticatedUserCard()),
          );
        },
      ),
    );
  }
}
