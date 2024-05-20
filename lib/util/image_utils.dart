// @since 2024/05/20
// @author 乌鸦
// @job Flutter Development
// @des:

import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
// @since 2024/5/20
// @author 乌鸦
// @job Flutter Development
// @des:

class ImageUtils {
  /// method_name getAssetImage
  /// description TODO
  ///
  /// [name]
  /// [format]
  ///return: [ImageProvider]
  static ImageProvider getAssetImage(String name, {ImageFormat format = ImageFormat.png}) {
    return AssetImage(getImgPath(name, format: format));
  }

  static String getImgPath(String name, {ImageFormat format = ImageFormat.png}) {
    return 'assets/images/$name.${format.value}';
  }

  static ImageProvider getImageProvide(String? imageUrl, {String holderImage = 'none'}) {
    if (TextUtil.isEmpty(imageUrl)) {
      return AssetImage(getImgPath(holderImage));
    }
    return CachedNetworkImageProvider(imageUrl!);
  }
}

enum ImageFormat { png, jpg, gif, webp }

extension ImageFormatExtension on ImageFormat {
  String get value => ['png', 'jpg', 'gif', 'webp'][index];
}
