import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_state.dart';

@singleton
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState._());

  changeTheme(String theme) async {
    var prefs = await SharedPreferences.getInstance();

    emit(
      SettingsState.change(theme),
    );

    await prefs.setString('theme', theme);
  }

  loadTheme() async {
    var prefs = await SharedPreferences.getInstance();

    String? theme = prefs.getString('theme');

    if (theme != null) {
      emit(
        SettingsState.change(theme),
      );
    }
  }
}
