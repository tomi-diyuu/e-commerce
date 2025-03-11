import 'package:e_commerce/src/network/model/product/product.dart';

enum MProductSort { none, priceLowToHigh, priceHighToLow }

extension MProductSortX on MProductSort {
  bool get isNone => this == MProductSort.none;
  bool get isPriceLowToHigh => this == MProductSort.priceLowToHigh;
  bool get isPriceHighToLow => this == MProductSort.priceHighToLow;

  bool apply(MProduct a, MProduct b) {
    switch (this) {
      case MProductSort.priceLowToHigh:
        return a.newPrice!.compareTo(b.newPrice!) < 0;
      case MProductSort.priceHighToLow:
        return b.newPrice!.compareTo(a.newPrice!) < 0;
      case MProductSort.none:
        return false;
    }
  }

  List<MProduct> applyAll(List<MProduct> products) {
    if (this == MProductSort.none) return products;
    List<MProduct> sortedList = products;
    sortedList.sort((a, b) => apply(a, b) ? -1 : 1);
    return sortedList;
  }

  String toSorterString() {
    switch (this) {
      case MProductSort.none:
        return "Sort";
      case MProductSort.priceLowToHigh:
        return "Price: lowest to high";
      case MProductSort.priceHighToLow:
        return "Price: highest to low";
    }
  }
}
