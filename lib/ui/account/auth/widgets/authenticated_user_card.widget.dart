import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shopping2/ui/account/auth/cubits/auth_cubit.dart';
import 'package:shopping2/ui/account/cubits/account_cubit.dart';

class AuthenticatedUserCard extends StatelessWidget {
  const AuthenticatedUserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return SizedBox(
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(state.account!.image!),
                      fit: BoxFit.fill,
                    ),
                    color: Theme.of(context).primaryColor,
                    border: Border.all(
                      width: 4.0,
                      color: Colors.white,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(200),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Bem vindo, ${state.account?.name}'),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    context.read<AuthCubit>().logout();
                  },
                  child: const Text(
                    'Sair',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
