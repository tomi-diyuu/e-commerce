/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/banner.png
  AssetGenImage get banner => const AssetGenImage('assets/images/banner.png');

  /// File path: assets/images/ic_activated_bag.png
  AssetGenImage get icActivatedBag =>
      const AssetGenImage('assets/images/ic_activated_bag.png');

  /// File path: assets/images/ic_activated_heart.png
  AssetGenImage get icActivatedHeart =>
      const AssetGenImage('assets/images/ic_activated_heart.png');

  /// File path: assets/images/ic_activated_home.png
  AssetGenImage get icActivatedHome =>
      const AssetGenImage('assets/images/ic_activated_home.png');

  /// File path: assets/images/ic_activated_profile.png
  AssetGenImage get icActivatedProfile =>
      const AssetGenImage('assets/images/ic_activated_profile.png');

  /// File path: assets/images/ic_activated_shop.png
  AssetGenImage get icActivatedShop =>
      const AssetGenImage('assets/images/ic_activated_shop.png');

  /// File path: assets/images/ic_bag.png
  AssetGenImage get icBag => const AssetGenImage('assets/images/ic_bag.png');

  /// File path: assets/images/ic_facebook.png
  AssetGenImage get icFacebook =>
      const AssetGenImage('assets/images/ic_facebook.png');

  /// File path: assets/images/ic_google.png
  AssetGenImage get icGoogle =>
      const AssetGenImage('assets/images/ic_google.png');

  /// File path: assets/images/ic_heart.png
  AssetGenImage get icHeart =>
      const AssetGenImage('assets/images/ic_heart.png');

  /// File path: assets/images/ic_home.png
  AssetGenImage get icHome => const AssetGenImage('assets/images/ic_home.png');

  /// File path: assets/images/ic_profile.png
  AssetGenImage get icProfile =>
      const AssetGenImage('assets/images/ic_profile.png');

  /// File path: assets/images/ic_shop.png
  AssetGenImage get icShop => const AssetGenImage('assets/images/ic_shop.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    banner,
    icActivatedBag,
    icActivatedHeart,
    icActivatedHome,
    icActivatedProfile,
    icActivatedShop,
    icBag,
    icFacebook,
    icGoogle,
    icHeart,
    icHome,
    icProfile,
    icShop,
  ];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
