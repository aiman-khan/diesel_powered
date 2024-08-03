import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/widgets/app_filled_button.dart';
import 'package:diesel_powered/common/widgets/app_text.dart';
import 'package:diesel_powered/common/widgets/phone_number_input_field.dart';
import 'package:diesel_powered/features/auth/domain/models/auth_step/auth_step_model.dart';
import 'package:diesel_powered/features/auth/presentation/providers/auth_step_provider/auth_step_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/reset_password/initiate_reset_password_verification_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/reset_password/reset_password_form_provider.dart';
import 'package:diesel_powered/features/auth/presentation/views/widgets/auth_bg_widget.dart';
import 'package:diesel_powered/util/exceptions/message_exception.dart';
import 'package:diesel_powered/util/loading/loading.dart';
import 'package:diesel_powered/util/resources/r.dart';
import 'package:diesel_powered/util/router/paths.dart';
import 'package:diesel_powered/util/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordView extends ConsumerStatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  ConsumerState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends ConsumerState<ForgotPasswordView> {
  final formKey = GlobalKey<FormState>();

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
    if (formKey.currentState?.validate() ?? false) {
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

    return AuthBgWidget(
      height: 507.h,
      child: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                44.hb,
                AppText(
                  text: 'Forgot Password',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: R.colors.black,
                ),
                7.95.hb,
                AppText(
                  text: 'Enter your email to recover your password',
                  fontSize: 15,
                  color: R.colors.black,
                  textAlign: TextAlign.center,
                ),
                31.78.hb,
                PhoneNumberInputField(
                  onChanged: (v) {
                    ref
                        .read(resetPasswordFormProvider.notifier)
                        .setPhone(v.completeNumber);
                  },
                ),
                80.hb,
                Center(
                  child: AppFilledButton(
                    text: 'Verify',
                    onTap: _submit,
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
