import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/widgets/app_filled_button.dart';
import 'package:diesel_powered/common/widgets/back_button_widget.dart';
import 'package:diesel_powered/common/widgets/email_input_field.dart';
import 'package:diesel_powered/common/widgets/name_input_field.dart';
import 'package:diesel_powered/common/widgets/phone_number_input_field.dart';
import 'package:diesel_powered/common/widgets/user_avatar.dart';
import 'package:diesel_powered/features/auth/presentation/providers/driver_provider/driver_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/update_profile_provider/update_profile_form_provider.dart';
import 'package:diesel_powered/features/auth/presentation/views/profile_update/popups/delete_account_popup.dart';
import 'package:diesel_powered/features/image_picker/presentation/providers/get_camera_image_provider.dart';
import 'package:diesel_powered/features/image_picker/presentation/providers/get_gallery_image_provider.dart';
import 'package:diesel_powered/features/image_picker/presentation/providers/request_camera_permission_provider.dart';
import 'package:diesel_powered/features/image_picker/presentation/providers/request_storage_permission_provider.dart';
import 'package:diesel_powered/features/image_picker/presentation/views/popups/allow_permission_popup.dart';
import 'package:diesel_powered/features/image_picker/presentation/views/popups/image_picker_popup.dart';
import 'package:diesel_powered/gen/assets.gen.dart';
import 'package:diesel_powered/util/exceptions/message_exception.dart';
import 'package:diesel_powered/util/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              BackButtonWidget(
                title: 'Profile',
              ),
              12.hb,
              const Flexible(
                child: ProfileItemsWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileItemsWidget extends ConsumerStatefulWidget {
  const ProfileItemsWidget({super.key});

  @override
  ConsumerState<ProfileItemsWidget> createState() => _ProfileItemsWidgetState();
}

class _ProfileItemsWidgetState extends ConsumerState<ProfileItemsWidget> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  String imageUrl = '';
  bool isUpdated = false;

  @override
  void initState() {
    super.initState();
    initializeControllers();
  }

  Future<void> initializeControllers() async {
    final user = await ref.read(driverProvider.future);
    nameController.text = user!.name;
    emailController.text = user.email;
    phoneNumberController.text = user.phone!;
  }

  Future<void> disposeControllers() async {
    nameController.dispose();
    emailController.dispose();
  }

  @override
  void dispose() {
    super.dispose();
    disposeControllers();
  }

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
      child: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              30.hb,

              /// [User Image]
              /// [Edit profile picture]
              Stack(
                children: [
                  Stack(
                    children: [
                      Consumer(
                        builder: (context, ref, _) {
                          final userAsync = ref.watch(driverProvider);

                          if (!userAsync.hasValue) {
                            return const SizedBox();
                          }

                          final user = userAsync.value;
                          return UserProfileAvatar(
                            image: user!.img,
                          );
                        },
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: InkWell(
                          onTap: () => _onTapEditAvatar(),
                          child: CircleAvatar(
                            radius: 18.r,
                            child: Assets.svgs.settingsIcon.svg(),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),

              62.hb,

              NameInputField(
                onChanged: (v) {},
                controller: nameController,
                hintText: 'John Doe',
              ),

              15.hb,

              EmailInputField(
                onChanged: (v) {},
                hintText: 'abc@xyz.com',
                controller: emailController,
              ),

              15.hb,

              PhoneNumberInputField(
                onChanged: (v) {},
                controller: phoneNumberController,
              ),

              15.hb,

              AppFilledButton(
                width: 337,
                text: 'Update',
                onTap: _update,
              ),

              17.hb,
              AppFilledButton(
                width: 337,
                text: 'Delete My Account',
                onTap: () {
                  showDialog<void>(
                    context: context,
                    builder: (context) {
                      return const DeleteAccountPopup();
                    },
                  );
                },
              ),

              12.hb,
            ],
          ),
        ),
      ),
    );
  }
}
