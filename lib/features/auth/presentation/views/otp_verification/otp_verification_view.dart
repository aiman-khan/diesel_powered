import 'dart:async';

import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/widgets/app_filled_button.dart';
import 'package:diesel_powered/common/widgets/app_text.dart';
import 'package:diesel_powered/common/widgets/back_button_widget.dart';
import 'package:diesel_powered/common/widgets/otp_field_widget.dart';
import 'package:diesel_powered/features/auth/presentation/providers/auth_step_provider/auth_step_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/otp_form_provider/otp_form_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/reset_password/initiate_reset_password_verification_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/reset_password/reset_password_form_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/update_profile_provider/update_profile_form_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/update_profile_provider/update_profile_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/verify_reset_password_otp_provider/verify_reset_password_otp_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/verify_update_profile_otp_provider/verify_update_profile_otp_provider.dart';
import 'package:diesel_powered/gen/assets.gen.dart';
import 'package:diesel_powered/util/exceptions/message_exception.dart';
import 'package:diesel_powered/util/loading/loading.dart';
import 'package:diesel_powered/util/resources/r.dart';
import 'package:diesel_powered/util/router/paths.dart';
import 'package:diesel_powered/util/toast/toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OTPVerificationView extends ConsumerStatefulWidget {
  const OTPVerificationView({
    this.profileChangePassword,
    super.key,
  });

  final bool? profileChangePassword;

  @override
  ConsumerState createState() => _OTPVerificationViewState();
}

class _OTPVerificationViewState extends ConsumerState<OTPVerificationView> {
  late Timer _timer;
  int _secondsRemaining = 60;
  bool resendCode = false;

  Future<void> _verifyOtp() async {
    final otp = ref.read(otpFormNotifierProvider);
    FocusManager.instance.primaryFocus?.unfocus();

    try {
      loading(context);
      if (otp != null && otp.length == 4) {
        if (widget.profileChangePassword != null &&
            widget.profileChangePassword!) {
          await ref.read(verifyUpdateProfileOtpProvider.future);

          if (!mounted) return;

          GoRouter.of(context).pop();

          await ref.read(updateProfileProvider.future);
          if (!mounted) return;

          showToast(msg: 'Profile updated successfully');
        } else {
          await ref.read(verifyResetPasswordOtpProvider.future);
          if (!mounted) return;

          showToast(msg: 'OTP verified successfully');
          if (!mounted) return;

          GoRouter.of(context).pushReplacement(RoutePaths.resetPassword);
        }
      } else {
        showToast(msg: 'Enter a valid OTP');
      }
    } on MessageException catch (e) {
      showToast(msg: e.message);
    } catch (e) {
      showToast(msg: 'Something went wrong');
    } finally {
      dismissLoading();
    }
  }

  Future<void> _resendOtp() async {
    try {
      loading(context);

      await ref.read(initiateResetPasswordVerificationProvider.future);

      setState(() {
        _secondsRemaining = 60;
      });

      startTimer();

      if (!mounted) return;

      showToast(msg: 'OTP sent to your phone');
    } on MessageException catch (e) {
      showToast(msg: e.message);
    } catch (e) {
      showToast(msg: 'Something went wrong');
    } finally {
      dismissLoading();
    }
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_secondsRemaining == 0) {
            resendCode = true;
          }
          if (_secondsRemaining < 1) {
            timer.cancel();
          } else {
            _secondsRemaining -= 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(authStepNotifierProvider);
    ref.watch(resetPasswordFormProvider);
    ref.watch(otpFormNotifierProvider);
    ref.watch(updateProfileFormProvider);

    return KeyboardDismissOnTap(
      child: Scaffold(
        backgroundColor: R.colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const BackButtonWidget(title: 'Forgot Password'),
                50.hb,
                Assets.svgs.appLogo.svg(
                  width: 165.w,
                  height: 50.h,
                ),
                50.hb,
                SizedBox(
                  width: 211.w,
                  child: AppText(
                    text:
                        'Please Enter the 4 Digit Code Send to Your Given Email',
                    fontSize: 13,
                    color: R.colors.black,
                    textAlign: TextAlign.center,
                  ),
                ),
                24.hb,
                OtpWidget(
                  onChanged: (v) {
                    ref.read(otpFormNotifierProvider.notifier).state = v;
                  },
                ),
                24.hb,
                if (_secondsRemaining <= 0)
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: R.colors.black,
                          fontFamily: 'Urbanist',
                        ),
                        children: [
                          const TextSpan(
                            text: 'Did not receive a code?',
                          ),
                          TextSpan(
                            text: ' Resend code',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: R.colors.primary,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = _resendOtp,
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: R.colors.black,
                        fontFamily: 'Urbanist',
                      ),
                      children: [
                        const TextSpan(
                          text: 'Resend OTP in ',
                        ),
                        TextSpan(
                          text: '$_secondsRemaining seconds',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: R.colors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                40.hb,
                Center(
                  child: AppFilledButton(
                    text: 'Verify',
                    onTap: _verifyOtp,
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
