part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final String currentTheme;

  String get getTheme => currentTheme;

  const SettingsState._({this.currentTheme = 'light'});

  const SettingsState.change(String theme) : this._(currentTheme: theme);

  @override
  List<Object?> get props => [currentTheme];
}
