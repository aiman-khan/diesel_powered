import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/widgets/app_filled_button.dart';
import 'package:diesel_powered/common/widgets/app_text.dart';
import 'package:diesel_powered/common/widgets/password_input_field.dart';
import 'package:diesel_powered/features/auth/presentation/providers/auth_step_provider/auth_step_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/reset_password/reset_password_form_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/reset_password/reset_password_provider.dart';
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

class ResetPasswordView extends ConsumerStatefulWidget {
  const ResetPasswordView({
    this.profileChangePassword,
    super.key,
  });

  final bool? profileChangePassword;

  @override
  ConsumerState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends ConsumerState<ResetPasswordView> {
  final formKey = GlobalKey<FormState>();

  final _passwordInputController = TextEditingController();
  final _confirmPasswordInputController = TextEditingController();

  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;

  void initializeNodes() {
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  Future<void> disposeNodes() async {
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
  }

  Future<void> disposeControllers() async {
    _passwordInputController.dispose();
    _confirmPasswordInputController.dispose();
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
        await ref.read(resetPasswordProvider.future);
        if (!mounted) return;

        showToast(msg: 'Password Changed');
        GoRouter.of(context).pushReplacement(RoutePaths.login);
      } on MessageException catch (e) {
        showToast(msg: e.message);
      } catch (e) {
        showToast(msg: 'Something went wrong');
      } finally {
        dismissLoading();
      }
    }
  }

  String? validatePassword(String? password) {
    if (password == null || password.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (password.length > 64) {
      return 'Password cannot be more than 64 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (password == null || password.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (confirmPassword == null || confirmPassword.length < 6) {
      return 'Password must be at least 8 characters';
    }
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(resetPasswordFormProvider);
    ref.watch(authStepNotifierProvider);

    bool passwordAutoFocus = false;
    bool confirmPasswordAutoFocus = false;

    return AuthBgWidget(
      height: 507.h,
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              20.hb,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                child: Column(
                  children: [
                    44.hb,
                    AppText(
                      text: 'Reset Password',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: R.colors.black,
                    ),
                    7.95.hb,
                    SizedBox(
                      width: 238.w,
                      child: AppText(
                        text: 'Reset your password',
                        fontSize: 16,
                        color: R.colors.black,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    27.77.hb,
                    PasswordInputField(
                      autofocus: passwordAutoFocus,
                      focusNode: passwordFocusNode,
                      onEditingComplete: () =>
                          confirmPasswordFocusNode.requestFocus(),
                      onChanged: (v) {
                        ref
                            .read(resetPasswordFormProvider.notifier)
                            .setPassword(v!);
                        setState(() {
                          passwordAutoFocus = true;
                        });
                      },
                      labelText: 'New Password',
                      hintText: 'New Password',
                      controller: _passwordInputController,
                      validator: validatePassword,
                    ),
                    16.hb,
                    PasswordInputField(
                      autofocus: confirmPasswordAutoFocus,
                      focusNode: confirmPasswordFocusNode,
                      onChanged: (v) {
                        setState(() {
                          confirmPasswordAutoFocus = true;
                        });
                      },
                      labelText: 'Confirm Password',
                      controller: _confirmPasswordInputController,
                      hintText: 'Confirm Password',
                      validator: (value) {
                        return validateConfirmPassword(
                            _passwordInputController.text, value);
                      },
                    ),
                    48.95.hb,
                    Center(
                      child: AppFilledButton(
                        text: 'Update Password',
                        onTap: _submit,
                      ),
                    ),
                  ],
                ),
              ),
              20.hb,
            ],
          ),
        ),
      ),
    );
  }
}
