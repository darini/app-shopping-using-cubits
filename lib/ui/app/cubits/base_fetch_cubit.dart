import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping2/ui/app/enums/enums.dart';

part 'base_fetch_state.dart';

abstract class BaseFetchCubit<T extends BaseFetchState> extends Cubit<T> {
  final T _initialState;

  BaseFetchCubit(this._initialState) : super(_initialState);

  void getAll() async => throw UnimplementedError();
}
