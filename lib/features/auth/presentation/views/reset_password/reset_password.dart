import 'package:calculator_flutter_app/common/extensions/num.dart';
import 'package:calculator_flutter_app/common/widgets/app_filled_button.dart';
import 'package:calculator_flutter_app/common/widgets/back_button_widget.dart';
import 'package:calculator_flutter_app/common/widgets/password_input_field.dart';
import 'package:calculator_flutter_app/features/auth/presentation/providers/auth_step_provider/auth_step_provider.dart';
import 'package:calculator_flutter_app/features/auth/presentation/providers/reset_password/reset_password_form_provider.dart';
import 'package:calculator_flutter_app/features/auth/presentation/providers/reset_password/reset_password_provider.dart';
import 'package:calculator_flutter_app/gen/assets.gen.dart';
import 'package:calculator_flutter_app/util/exceptions/message_exception.dart';
import 'package:calculator_flutter_app/util/loading/loading.dart';
import 'package:calculator_flutter_app/util/resources/r.dart';
import 'package:calculator_flutter_app/util/router/paths.dart';
import 'package:calculator_flutter_app/util/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
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
                          controller: _confirmPasswordInputController,
                          hintText: 'Confirm Password',
                          validator: (value) {
                            return validateConfirmPassword(
                                _passwordInputController.text, value);
                          },
                        ),
                        40.hb,
                        Center(
                          child: AppFilledButton(
                            text: 'Update Password',
                            onTap: _submit,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                20.hb,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
