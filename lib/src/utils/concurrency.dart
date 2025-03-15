extension ConcurrencyX on int {
  String get formattedConcurrency {
    if (this == toInt()) {
      return "${toInt()}\$";
    } else {
      return "${toStringAsFixed(1)}\$";
    }
  }
}
