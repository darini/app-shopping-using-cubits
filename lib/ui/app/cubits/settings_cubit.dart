import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping2/util/constants.dart';

part 'settings_state.dart';

@singleton
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState._());

  changeTheme(String theme) async {
    emit(
      SettingsState.change(theme),
    );
  }
}
