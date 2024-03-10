import 'package:calculator_flutter_app/util/resources/r.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfileAvatar extends ConsumerWidget {
  const UserProfileAvatar({
    super.key,
    this.size,
    this.hasBorder = false,
    this.image,
  });

  final double? size;
  final String? image;
  final bool hasBorder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: size ?? 72.r,
      width: size ?? 72.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(66.r),
        color: hasBorder ? R.colors.primary : R.colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(66.r),
        child: image != null
            ? CachedNetworkImage(
                imageUrl: image!,
                fit: BoxFit.cover,
              )
            : Icon(
                Icons.person,
                color: hasBorder ? R.colors.white : R.colors.primary,
                size: 36.r,
              ),
      ),
    );
  }
}
