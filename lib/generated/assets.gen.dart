/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/analyze.svg
  SvgGenImage get analyze => const SvgGenImage('assets/icons/analyze.svg');

  /// File path: assets/icons/assets_icon.svg
  SvgGenImage get assetsIcon =>
      const SvgGenImage('assets/icons/assets_icon.svg');

  /// File path: assets/icons/booking_icon.svg
  SvgGenImage get bookingIcon =>
      const SvgGenImage('assets/icons/booking_icon.svg');

  /// File path: assets/icons/break_fluid.svg
  SvgGenImage get breakFluid =>
      const SvgGenImage('assets/icons/break_fluid.svg');

  /// File path: assets/icons/buy_car_icon.svg
  SvgGenImage get buyCarIcon =>
      const SvgGenImage('assets/icons/buy_car_icon.svg');

  /// File path: assets/icons/calendar_icon.svg
  SvgGenImage get calendarIcon =>
      const SvgGenImage('assets/icons/calendar_icon.svg');

  /// File path: assets/icons/checkbox_off.svg
  SvgGenImage get checkboxOff =>
      const SvgGenImage('assets/icons/checkbox_off.svg');

  /// File path: assets/icons/checkbox_on.svg
  SvgGenImage get checkboxOn =>
      const SvgGenImage('assets/icons/checkbox_on.svg');

  /// File path: assets/icons/dashboard_icon.svg
  SvgGenImage get dashboardIcon =>
      const SvgGenImage('assets/icons/dashboard_icon.svg');

  /// File path: assets/icons/drop_down.svg
  SvgGenImage get dropDown => const SvgGenImage('assets/icons/drop_down.svg');

  /// File path: assets/icons/energy.svg
  SvgGenImage get energy => const SvgGenImage('assets/icons/energy.svg');

  /// File path: assets/icons/energy_small.svg
  SvgGenImage get energySmall =>
      const SvgGenImage('assets/icons/energy_small.svg');

  /// File path: assets/icons/log_out.svg
  SvgGenImage get logOut => const SvgGenImage('assets/icons/log_out.svg');

  /// File path: assets/icons/message.svg
  SvgGenImage get message => const SvgGenImage('assets/icons/message.svg');

  /// File path: assets/icons/messages_icon.svg
  SvgGenImage get messagesIcon =>
      const SvgGenImage('assets/icons/messages_icon.svg');

  /// File path: assets/icons/notification.svg
  SvgGenImage get notification =>
      const SvgGenImage('assets/icons/notification.svg');

  /// File path: assets/icons/range.svg
  SvgGenImage get range => const SvgGenImage('assets/icons/range.svg');

  /// File path: assets/icons/recomended.svg
  SvgGenImage get recomended =>
      const SvgGenImage('assets/icons/recomended.svg');

  /// File path: assets/icons/repeat.svg
  SvgGenImage get repeat => const SvgGenImage('assets/icons/repeat.svg');

  /// File path: assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/search.svg');

  /// File path: assets/icons/sell_cars_icon.svg
  SvgGenImage get sellCarsIcon =>
      const SvgGenImage('assets/icons/sell_cars_icon.svg');

  /// File path: assets/icons/services_icon.svg
  SvgGenImage get servicesIcon =>
      const SvgGenImage('assets/icons/services_icon.svg');

  /// File path: assets/icons/setting.svg
  SvgGenImage get setting => const SvgGenImage('assets/icons/setting.svg');

  /// File path: assets/icons/settings_icon.svg
  SvgGenImage get settingsIcon =>
      const SvgGenImage('assets/icons/settings_icon.svg');

  /// File path: assets/icons/star.svg
  SvgGenImage get star => const SvgGenImage('assets/icons/star.svg');

  /// File path: assets/icons/tire_wear.svg
  SvgGenImage get tireWear => const SvgGenImage('assets/icons/tire_wear.svg');

  /// File path: assets/icons/warning.svg
  SvgGenImage get warning => const SvgGenImage('assets/icons/warning.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        analyze,
        assetsIcon,
        bookingIcon,
        breakFluid,
        buyCarIcon,
        calendarIcon,
        checkboxOff,
        checkboxOn,
        dashboardIcon,
        dropDown,
        energy,
        energySmall,
        logOut,
        message,
        messagesIcon,
        notification,
        range,
        recomended,
        repeat,
        search,
        sellCarsIcon,
        servicesIcon,
        setting,
        settingsIcon,
        star,
        tireWear,
        warning
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/avatar.png
  AssetGenImage get avatar => const AssetGenImage('assets/images/avatar.png');

  /// File path: assets/images/car_assets.png
  AssetGenImage get carAssets =>
      const AssetGenImage('assets/images/car_assets.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/mini_cooper.png
  AssetGenImage get miniCooper =>
      const AssetGenImage('assets/images/mini_cooper.png');

  /// File path: assets/images/porsche_carella_1.png
  AssetGenImage get porscheCarella1 =>
      const AssetGenImage('assets/images/porsche_carella_1.png');

  /// File path: assets/images/porsche_carella_2.png
  AssetGenImage get porscheCarella2 =>
      const AssetGenImage('assets/images/porsche_carella_2.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [avatar, carAssets, logo, miniCooper, porscheCarella1, porscheCarella2];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

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
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
