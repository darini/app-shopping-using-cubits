import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping2/ui/app/cubits/settings_cubit.dart';
import 'package:shopping2/ui/app/pages/tabs.page.dart';
import 'package:shopping2/ui/themes/dark_theme.dart';
import 'package:shopping2/ui/themes/dark_yellow_theme.dart';
import 'package:shopping2/ui/themes/light_theme.dart';

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) =>
          previous.currentTheme != current.currentTheme,
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shopping',
          theme: getTheme(state.getTheme),
          home: const DefaultTabController(
            length: 3,
            child: TabsPage(),
          ),
        );
      },
    );
  }

  ThemeData getTheme(String theme) {
    switch (theme) {
      case 'light':
        return lightTheme();
      case 'dark':
        return darkTheme();
      case 'dark-yellow':
        return darkYellowTheme();
      default:
        return lightTheme();
    }
  }
}
