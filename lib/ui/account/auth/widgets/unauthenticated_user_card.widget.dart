import 'package:flutter/material.dart';
import 'package:shopping2/ui/account/pages/login_page.dart';

class UnauthenticatedUserCard extends StatelessWidget {
  const UnauthenticatedUserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 60,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          },
          child: const Text('Autentique-se'),
        ),
        TextButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => //const SignupPage(),
            //   ),
            // );
          },
          child: const Text('Ainda não sou cadastrado'),
        ),
      ],
    );
  }
}
