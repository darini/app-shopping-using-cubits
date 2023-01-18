part of 'base_fetch_cubit.dart';

abstract class BaseFetchState<T> extends Equatable {
  final LoadStatus status;
  final List<T> data;
  final String? message;

  const BaseFetchState._({
    this.status = LoadStatus.loading,
    this.data = const [],
    this.message,
  });

  const BaseFetchState.initial() : this._();

  const BaseFetchState.loading() : this._();

  const BaseFetchState.loaded({
    required List<T> data,
  }) : this._(
          status: LoadStatus.success,
          data: data,
        );

  const BaseFetchState.failed({
    required String message,
  }) : this._(
          message: message,
          status: LoadStatus.failure,
        );

  bool get hasMessage => message != null && message!.isNotEmpty;

  bool get isLoading => status == LoadStatus.loading;

  bool get isFetched => status == LoadStatus.success;

  @override
  List<Object?> get props => [status, data, message];
}
