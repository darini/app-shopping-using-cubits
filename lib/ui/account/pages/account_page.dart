import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping2/ui/account/auth/cubits/auth_cubit.dart';
import 'package:shopping2/ui/account/auth/widgets/authenticated_user_card.widget.dart';
import 'package:shopping2/ui/account/auth/widgets/unauthenticated_user_card.widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
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
          body: state.isAuthenticated
              ? const AuthenticatedUserCard()
              : const UnauthenticatedUserCard(),
        );
      },
    );
  }
}
