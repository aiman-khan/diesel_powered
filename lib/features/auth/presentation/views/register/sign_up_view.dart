import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/widgets/app_filled_button.dart';
import 'package:diesel_powered/common/widgets/app_text.dart';
import 'package:diesel_powered/common/widgets/phone_number_input_field.dart';
import 'package:diesel_powered/features/auth/presentation/providers/register/register_form_provider.dart';
import 'package:diesel_powered/features/auth/presentation/providers/register/register_provider.dart';
import 'package:diesel_powered/gen/assets.gen.dart';
import 'package:diesel_powered/util/exceptions/message_exception.dart';
import 'package:diesel_powered/util/loading/loading.dart';
import 'package:diesel_powered/util/resources/r.dart';
import 'package:diesel_powered/util/router/paths.dart';
import 'package:diesel_powered/util/toast/toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
    final padding = MediaQuery.of(context).padding;
    ref.watch(registerFormProvider);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          width: 1.sw,
          height: 1.sh,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.pngs.authBg.path),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                padding.top.hb,
                36.hb,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.svgs.appLogo.svg(
                      height: 45.r,
                      width: 45.r,
                    ),
                    3.wb,
                    const AppText(
                      text: 'diesel_powered',
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
                5.hb,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: 'Welcome Back',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                3.hb,
                SizedBox(
                  width: 330.w,
                  height: 72.h,
                  child: AppText(
                    text:
                        'Tap "Get Started" to get an SMS confirmation to help you use RUBER. We would like your phone number.',
                    fontSize: 16.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
                64.hb,
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          PhoneNumberInputField(
                            onChanged: (value) {
                              ref
                                  .read(registerFormProvider.notifier)
                                  .setPhoneNumber(value.completeNumber);

                              setState(() {
                                loginValid = value.isValidNumber();
                              });
                            },
                          ),
                          70.hb,
                          AppFilledButton(
                            text: 'Sign Up',
                            onTap: () => _signUp(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      color: R.colors.black,
                      fontSize: 16.sp,
                      fontFamily: 'Poppins',
                    ),
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: R.colors.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            GoRouter.of(context).pop();
                          },
                      ),
                    ],
                  ),
                ),
                32.hb,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
