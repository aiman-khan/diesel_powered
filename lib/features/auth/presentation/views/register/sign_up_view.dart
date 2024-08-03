import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/widgets/app_filled_button.dart';
import 'package:diesel_powered/common/widgets/app_text.dart';
import 'package:diesel_powered/common/widgets/email_input_field.dart';
import 'package:diesel_powered/common/widgets/name_input_field.dart';
import 'package:diesel_powered/common/widgets/password_input_field.dart';
import 'package:diesel_powered/features/auth/presentation/providers/register/register_form_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/register/register_provider.dart';
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

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<SignUpView> {
  bool loginValid = false;

  final _formKey = GlobalKey<FormState>();

  final _passwordInput = TextEditingController();

  late FocusNode passwordFocusNode;

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

  void initializeNodes() {
    passwordFocusNode = FocusNode();
  }

  Future<void> disposeNodes() async {
    passwordFocusNode.dispose();
  }

  Future<void> disposeControllers() async {
    _passwordInput.dispose();
  }

  Future<void> _signUp() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (loginValid && _formKey.currentState!.validate()) {
      try {
        loading(context);
        await ref.read(registerProvider.future);
        if (!mounted) return;

        GoRouter.of(context).push(RoutePaths.otpVerification);
      } on MessageException catch (e) {
        showToast(msg: e.message);
      } catch (e) {
        if (!mounted) return;
        showToast(msg: 'Something went wrong $e');
      } finally {
        dismissLoading();
      }
    } else {
      showToast(msg: 'Please enter a valid phone number');
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(registerFormProvider);

    return KeyboardDismissOnTap(
      child: Scaffold(
        backgroundColor: R.colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                36.hb,
                Assets.svgs.appLogo.svg(
                  width: 165.w,
                  height: 50.h,
                ),
                24.hb,
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 19.w),
                    child: Column(
                      children: [
                        24.hb,
                        AppText(
                          text: 'Sign Up',
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: R.colors.secondary,
                        ),
                        24.hb,
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
                        NameInputField(
                          onChanged: (v) {
                            ref.read(registerFormProvider.notifier).setName(v!);
                          },
                          hintText: 'Name',
                        ),
                        16.hb,
                        EmailInputField(
                          onChanged: (v) {
                            ref
                                .read(registerFormProvider.notifier)
                                .setEmail(v!);
                          },
                          hintText: 'Email',
                        ),
                        16.hb,
                        PasswordInputField(
                          focusNode: passwordFocusNode,
                          controller: _passwordInput,
                          onChanged: (v) {
                            ref
                                .read(registerFormProvider.notifier)
                                .setPassword(v!);
                          },
                          hintText: 'Password',
                        ),
                        16.hb,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                GoRouter.of(context)
                                    .push(RoutePaths.forgetPassword);
                              },
                              child: AppText(
                                text: 'Forgot Password?',
                                fontSize: 12,
                                color: R.colors.secondary.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                        40.hb,
                        Center(
                          child: AppFilledButton(
                            text: 'Sign Up',
                            onTap: _signUp,
                            width: 294,
                          ),
                        ),
                        30.hb,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              text: 'Already have an account?',
                              fontSize: 14,
                              color: R.colors.secondary,
                              fontWeight: FontWeight.w500,
                            ),
                            5.wb,
                            InkWell(
                              onTap: () {
                                GoRouter.of(context).pop();
                              },
                              child: AppText(
                                text: 'Sign In',
                                color: R.colors.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
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
