abstract class UseCase<R, P> {

  /// Execute this use case with the provided [params] and returns its
  /// result.
  Future<R> execute(P params);
}

abstract class NoParamsUseCase<R> {

  /// Execute this use case and returns its result.
  Future<R> execute();
}

abstract class NoResultUseCase<P> {

  /// Execute this use case with the provided [params].
  Future<void> execute(P params);
}

abstract class NoParamsNoResultUseCase {

  /// Execute this use case.
  Future<void> execute();
}