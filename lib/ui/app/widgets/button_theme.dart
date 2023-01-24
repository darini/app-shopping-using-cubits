import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping2/ui/app/cubits/settings_cubit.dart';

class ButtonThemeSettings extends StatelessWidget {
  final String theme;

  const ButtonThemeSettings({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<SettingsCubit>().changeTheme(theme);
      },
      child: textTheme(),
    );
  }

  Widget textTheme() {
    switch (theme) {
      case 'light':
        {
          return const Text(
            'Light',
            style: TextStyle(
              color: Colors.blue,
            ),
          );
        }
      case 'dark':
        {
          return const Text(
            'Dark',
            style: TextStyle(
              color: Color.fromARGB(255, 32, 31, 31),
            ),
          );
        }
      case 'dark-yellow':
        {
          return const Text(
            'Dark Yellow',
            style: TextStyle(
              color: Color(0xFFFFCC00),
            ),
          );
        }
      default:
        {
          return const Text(
            'Light',
            style: TextStyle(
              color: Colors.blue,
            ),
          );
        }
    }
  }
}
