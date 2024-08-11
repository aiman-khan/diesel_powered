import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/widgets/app_filled_button.dart';
import 'package:diesel_powered/common/widgets/app_text.dart';
import 'package:diesel_powered/common/widgets/back_button_widget.dart';
import 'package:diesel_powered/common/widgets/text_input_field.dart';
import 'package:diesel_powered/features/auth/domain/models/auth_step/auth_step_model.dart';
import 'package:diesel_powered/features/auth/presentation/providers/auth_step_provider/auth_step_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/reset_password/initiate_reset_password_verification_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/reset_password/reset_password_form_provider.dart';
import 'package:diesel_powered/features/auth/presentation/views/widgets/social_sign_in_buttons.dart';
import 'package:diesel_powered/gen/assets.gen.dart';
import 'package:diesel_powered/util/exceptions/message_exception.dart';
import 'package:diesel_powered/util/loading/loading.dart';
import 'package:diesel_powered/util/resources/r.dart';
import 'package:diesel_powered/util/router/paths.dart';
import 'package:diesel_powered/util/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordView extends ConsumerStatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  ConsumerState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends ConsumerState<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();

  final _emailInput = TextEditingController();

  late FocusNode emailFocusNode;

  void initializeNodes() {
    emailFocusNode = FocusNode();
  }

  Future<void> disposeNodes() async {
    emailFocusNode.dispose();
  }

  Future<void> disposeControllers() async {
    _emailInput.dispose();
  }

  @override
  void initState() {
    super.initState();
    initializeNodes();
  }

  @override
  void dispose() {
    super.dispose();
    disposeControllers();
    disposeNodes();
  }

  Future<void> _submit() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState?.validate() ?? false) {
      try {
        loading(context);
        ref
            .read(authStepNotifierProvider.notifier)
            .update((state) => AuthStepModel.resetPassword);

        await ref.read(initiateResetPasswordVerificationProvider.future);

        if (!mounted) return;

        GoRouter.of(context).push(RoutePaths.otpVerification);
        showToast(msg: 'OTP has been sent to your email');
      } on MessageException catch (e) {
        showToast(msg: e.message);
      } catch (e) {
        showToast(msg: 'Something went wrong');
      } finally {
        dismissLoading();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(authStepNotifierProvider);
    ref.watch(resetPasswordFormProvider);

    return KeyboardDismissOnTap(
      child: Scaffold(
        backgroundColor: R.colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const BackButtonWidget(title: 'Forgot Password'),
                36.hb,
                Assets.svgs.appLogo.svg(
                  width: 165.w,
                  height: 50.h,
                ),
                50.hb,
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 19.w),
                    child: Column(
                      children: [
                        const SocialSignInButtons(),
                        16.hb,
                        Row(
                          children: [
                            Container(
                              height: 0.5.h,
                              width: 150,
                              color: R.colors.black.withOpacity(0.2),
                            ),
                            14.wb,
                            const AppText(
                              text: 'Or',
                              fontSize: 14,
                            ),
                            14.wb,
                            Container(
                              height: 0.5.h,
                              width: 150,
                              color: R.colors.black.withOpacity(0.2),
                            ),
                          ],
                        ),
                        16.hb,
                        TextInputField(
                          onChanged: (v) {
                            ref
                                .read(resetPasswordFormProvider.notifier)
                                .setPhone(v!);
                          },
                          hintText: 'Email/Phone Number',
                        ),
                        40.hb,
                        Center(
                          child: AppFilledButton(
                            text: 'Send',
                            onTap: _submit,
                          ),
                        ),
                        12.hb,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
