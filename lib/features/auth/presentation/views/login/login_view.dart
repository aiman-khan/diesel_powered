import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/widgets/app_filled_button.dart';
import 'package:diesel_powered/common/widgets/app_text.dart';
import 'package:diesel_powered/common/widgets/gradient_text_widget.dart';
import 'package:diesel_powered/common/widgets/password_input_field.dart';
import 'package:diesel_powered/common/widgets/phone_number_input_field.dart';
import 'package:diesel_powered/features/auth/presentation/providers/login/login_form_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/login/login_provider.dart';
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

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final _phoneInput = TextEditingController();
  final _passwordInput = TextEditingController();

  late FocusNode phoneFocusNode;
  late FocusNode passwordFocusNode;

  void initializeNodes() {
    phoneFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  Future<void> disposeNodes() async {
    passwordFocusNode.dispose();
    phoneFocusNode.dispose();
  }

  Future<void> disposeControllers() async {
    _phoneInput.dispose();
    _passwordInput.dispose();
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

  Future<void> _login() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (_formKey.currentState!.validate()) {
      try {
        loading(context);
        await ref.read(loginProvider.future);
        if (!mounted) return;

        GoRouter.of(context).go(RoutePaths.home);
      } on MessageException catch (e) {
        showToast(msg: e.message);
      } catch (e) {
        if (!mounted) return;
        showToast(msg: 'Something went wrong');
      } finally {
        dismissLoading();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginForm = ref.watch(loginFormProvider);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 1.sw,
            height: 1.sh,
            child: Column(
              children: [
                184.hb,
                Assets.svgs.appLogo.svg(
                  width: 165.w,
                  height: 50.h,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 46.h,
            left: 22.h,
            right: 22.h,
            child: Container(
              width: 343.w,
              height: 418.h,
              decoration: BoxDecoration(
                color: R.colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: KeyboardDismissOnTap(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        children: [
                          29.hb,
                          AppText(
                            text: 'Login',
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: R.colors.black,
                          ),
                          15.05.hb,
                          PhoneNumberInputField(
                            isNotEmpty: loginForm.phone?.isNotEmpty ?? false,
                            focusNode: phoneFocusNode,
                            onEditingComplete: (v) {
                              passwordFocusNode.requestFocus();
                            },
                            onChanged: (v) {
                              ref
                                  .read(loginFormProvider.notifier)
                                  .setPhone(v.completeNumber);
                            },
                          ),
                          16.hb,
                          PasswordInputField(
                            focusNode: passwordFocusNode,
                            controller: _passwordInput,
                            onChanged: (v) {
                              ref
                                  .read(loginFormProvider.notifier)
                                  .setPassword(v!);
                            },
                            labelText: 'Password',
                            hintText: 'Password',
                          ),
                          7.hb,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  GoRouter.of(context)
                                      .push(RoutePaths.forgetPassword);
                                },
                                child: AppText(
                                  text: 'Forgot Password',
                                  fontSize: 12,
                                  color: R.colors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          15.hb,
                          Center(
                            child: AppFilledButton(
                              text: 'Login',
                              onTap: _login,
                              width: 294,
                            ),
                          ),
                          19.hb,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                text: "Don't have an account?",
                                fontSize: 12,
                                color: R.colors.greyTextField,
                                fontWeight: FontWeight.w500,
                              ),
                              5.wb,
                              InkWell(
                                onTap: () {
                                  GoRouter.of(context).push(RoutePaths.signUp);
                                },
                                child: GradientText(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -0.5.sp,
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      R.colors.primary,
                                      R.colors.primary,
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          12.hb,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
