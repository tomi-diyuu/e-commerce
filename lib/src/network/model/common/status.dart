enum MStatus { initial, loading, success, failure }

extension MStatusX on MStatus {
  bool get isLoading => this == MStatus.loading;
  bool get isInitial => this == MStatus.initial;
  bool get isSuccess => this == MStatus.success;
  bool get isFailure => this == MStatus.failure;
}