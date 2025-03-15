import 'package:e_commerce/src/utils/number.dart';

extension ConcurrencyX on int {
  String get formattedConcurrency {
    return "${toDouble().normalizeNumber}\$";
  }
}
