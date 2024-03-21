import 'package:calculator_flutter_app/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagePickerPopup extends StatelessWidget {
  const ImagePickerPopup({
    this.onTapCamera,
    this.onTapGallery,
    super.key,
  });

  final VoidCallback? onTapCamera;
  final VoidCallback? onTapGallery;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: R.colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// [Pick from Camera]
            ListTile(
              onTap: onTapCamera,
              leading: Icon(Icons.camera_alt, size: 24.r),
              title: Text(
                'Camera',
                style: TextStyle(
                  color: R.colors.black,
                  fontSize: 16.sp,
                ),
              ),
            ),

            /// [Pick from Gallery]
            ListTile(
              onTap: onTapGallery,
              leading: Icon(Icons.photo, size: 24.r),
              title: Text(
                'Gallery',
                style: TextStyle(
                  color: R.colors.black,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
