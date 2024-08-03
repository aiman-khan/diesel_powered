import 'package:diesel_powered/util/resources/r.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfileAvatar extends ConsumerWidget {
  const UserProfileAvatar({
    super.key,
    this.size,
    this.image,
  });

  final double? size;
  final String? image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 72.r,
      width: 72.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(66.r),
        border: Border.all(color: R.colors.primary),
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
                color: R.colors.primary,
                size: 36.r,
              ),
      ),
    );
  }
}
