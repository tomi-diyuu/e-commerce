extension DoubleX on double {
  String get normalizeNumber {
    if (this == toInt()) {
      return "${toInt()}";
    } else {
      return toStringAsFixed(1);
    }
  }
}
