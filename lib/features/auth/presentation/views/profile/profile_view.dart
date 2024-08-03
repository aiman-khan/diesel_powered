import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/widgets/app_text.dart';
import 'package:diesel_powered/common/widgets/user_avatar.dart';
import 'package:diesel_powered/features/auth/presentation/providers/driver_provider/driver_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/update_profile_provider/update_profile_form_provider.dart';
import 'package:diesel_powered/features/home/presentation/views/dialogs/logout_confirmation_dialog.dart';
import 'package:diesel_powered/features/image_picker/presentation/providers/get_camera_image_provider.dart';
import 'package:diesel_powered/features/image_picker/presentation/providers/get_gallery_image_provider.dart';
import 'package:diesel_powered/features/image_picker/presentation/providers/request_camera_permission_provider.dart';
import 'package:diesel_powered/features/image_picker/presentation/providers/request_storage_permission_provider.dart';
import 'package:diesel_powered/features/image_picker/presentation/views/popups/allow_permission_popup.dart';
import 'package:diesel_powered/features/image_picker/presentation/views/popups/image_picker_popup.dart';
import 'package:diesel_powered/features/premium/presentation/views/widgets/get_premium_card_widget.dart';
import 'package:diesel_powered/gen/assets.gen.dart';
import 'package:diesel_powered/util/exceptions/message_exception.dart';
import 'package:diesel_powered/util/resources/r.dart';
import 'package:diesel_powered/util/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  String imageUrl = '';
  bool isUpdated = false;

  void _update() {
    showToast(msg: 'Your profile has been updated');
  }

  /// [on Tap Gallery]
  Future<void> onTapGallery() async {
    try {
      await ref.read(requestStoragePermissionProvider.future);
      final image = await ref.read(getGalleryImageProvider.future);
      ref.read(updateProfileFormProvider.notifier).setImage(image);

      if (mounted) {
        GoRouter.of(context).pop();
      }
      return;
    } on MessageException catch (e) {
      showToast(msg: e.message);
      return;
    } on StoragePermissionDenied catch (_) {
      showToast(msg: 'Storage Permission is denied');
      return;
    } on StoragePermissionDeniedPermanently catch (_) {
      if (mounted) {
        await showDialog<void>(
          context: context,
          builder: (context) => const RequestPermissionWidget(
            icon: Icons.camera,
            description:
                'Allow app to access you gallery while you use the app',
          ),
        );
      }
      return;
    } on ImageFileNotSupportedException catch (_) {
      showToast(msg: 'File not supported');
      return;
    } on ImageSizeExceedsSizeLimitException catch (_) {
      showToast(msg: 'Image size exceeds 5Mb');
      return;
    } on ImageNotSelectedException catch (_) {
      return;
    } catch (e) {
      showToast(msg: 'Something went wrong');
    }
    return;
  }

  /// [on Tap Camera]
  Future<void> onTapCamera() async {
    try {
      await ref.read(requestCameraPermissionProvider.future);
      final image = await ref.read(getCameraImageProvider.future);
      ref.read(updateProfileFormProvider.notifier).setImage(image);

      if (mounted) {
        GoRouter.of(context).pop();
      }
      return;
    } on MessageException catch (e) {
      showToast(msg: e.message);
      return;
    } on CameraPermissionDenied catch (e) {
      showToast(msg: e.message);
      return;
    } on CameraPermissionDeniedPermanently catch (_) {
      if (mounted) {
        await showDialog<void>(
          context: context,
          builder: (context) => const RequestPermissionWidget(
            icon: Icons.camera_alt,
            description: 'Allow app to access you camera while you use the app',
          ),
        );
      }
      return;
    } on ImageNotSelectedException catch (_) {
      return;
    } catch (e) {
      showToast(msg: 'Something went wrong');
    }
  }

  /// [On tap edit Avatar]
  Future<void> _onTapEditAvatar() async {
    await showDialog<void>(
      context: context,
      builder: (context) {
        return ImagePickerPopup(
          onTapCamera: () => onTapCamera(),
          onTapGallery: () => onTapGallery(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            30.hb,

            /// [User Image]
            /// [Edit profile picture]
            Consumer(builder: (context, ref, _) {
              final userAsync = ref.watch(driverProvider);

              if (!userAsync.hasValue) {
                return const SizedBox();
              }

              final user = userAsync.value;
              return Column(
                children: [
                  Stack(
                    children: [
                      UserProfileAvatar(
                        image: user!.img,
                        size: 82.r,
                      ),
                      // Positioned(
                      //   right: 0,
                      //   bottom: 0,
                      //   child: Assets.svgs.tickIcon.svg(
                      //     height: 12.r,
                      //   ),
                      // )
                    ],
                  ),
                  16.hb,
                  AppText(
                    text: user.name,
                    color: R.colors.secondary,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                  2.hb,
                  AppText(
                    text: user.email,
                    color: R.colors.secondary.withOpacity(0.5),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  )
                ],
              );
            }),

            24.hb,

            const GetPremiumCardWidget(),

            29.hb,

            _buildSettingTile(
              name: 'Contact List',
              icon: Assets.svgs.addContactIcon.svg(),
              onTap: () {},
            ),

            _buildSettingTile(
              name: 'Quotes',
              icon: Assets.svgs.quoteIcon.svg(),
              onTap: () {},
            ),

            _buildSettingTile(
              name: 'Help Center',
              icon: Assets.svgs.helpIcon.svg(),
              onTap: () {},
            ),
            _buildSettingTile(
              name: 'Settings',
              icon: Assets.svgs.settingsIcon.svg(),
              onTap: () {},
            ),
            _buildSettingTile(
              name: 'Logout',
              icon: Assets.svgs.logoutIcon.svg(),
              color: R.colors.warningRed,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const LogoutConfirmationPopup();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required String name,
    required SvgPicture icon,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      leading: icon,
      minLeadingWidth: 0,
      title: AppText(
        text: name,
        fontSize: 16,
        color: color ?? R.colors.secondary,
      ),
      trailing: InkWell(
        onTap: onTap,
        child: Icon(
          Icons.chevron_right,
          size: 24.r,
          color: color ?? R.colors.secondary,
        ),
      ),
    );
  }
}
