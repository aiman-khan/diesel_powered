import 'package:diesel_powered/features/about/presentation/views/about/about_view.dart';
import 'package:diesel_powered/features/about/presentation/views/privacy_policy/privacy_policy_view.dart';
import 'package:diesel_powered/features/about/presentation/views/terms_of_service/terms_of_service_view.dart';
import 'package:diesel_powered/features/auth/presentation/views/forget_password/forgot_password_view.dart';
import 'package:diesel_powered/features/auth/presentation/views/login/login_view.dart';
import 'package:diesel_powered/features/auth/presentation/views/otp_verification/otp_verification_view.dart';
import 'package:diesel_powered/features/auth/presentation/views/profile/profile_view.dart';
import 'package:diesel_powered/features/auth/presentation/views/register/sign_up_view.dart';
import 'package:diesel_powered/features/auth/presentation/views/reset_password/reset_password.dart';
import 'package:diesel_powered/features/google_maps/domain/models/lat_lng/lat_lng_model.dart';
import 'package:diesel_powered/features/google_maps/presentation/views/search_location.dart';
import 'package:diesel_powered/features/google_maps/presentation/views/view_location.dart';
import 'package:diesel_powered/features/home/presentation/views/home_view.dart';
import 'package:diesel_powered/features/splash/presentation/splash_view.dart';
import 'package:diesel_powered/util/router/paths.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      builder: (context, state) {
        return const SplashView();
      },
    ),
    GoRoute(
      path: RoutePaths.login,
      builder: (context, state) {
        return const LoginView();
      },
    ),
    GoRoute(
      path: RoutePaths.signUp,
      builder: (context, state) {
        return const SignUpView();
      },
    ),
    GoRoute(
      path: RoutePaths.otpVerification,
      builder: (context, state) {
        final data = state.extra as bool?;
        return OTPVerificationView(profileChangePassword: data);
      },
    ),
    GoRoute(
        path: RoutePaths.forgetPassword,
        builder: (context, state) {
          return const ForgotPasswordView();
        }),
    GoRoute(
      path: RoutePaths.resetPassword,
      builder: (context, state) {
        return const ResetPasswordView();
      },
    ),
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) {
        return const HomeView();
      },
    ),
    GoRoute(
      path: RoutePaths.updateProfile,
      builder: (context, state) {
        return const ProfileView();
      },
    ),
    GoRoute(
      path: RoutePaths.about,
      builder: (context, state) {
        return const AboutView();
      },
    ),
    GoRoute(
      path: RoutePaths.privacyPolicy,
      builder: (context, state) {
        return const PrivacyPolicyView();
      },
    ),
    GoRoute(
      path: RoutePaths.termsOfService,
      builder: (context, state) {
        return const TermsOfServiceView();
      },
    ),
    GoRoute(
      path: RoutePaths.mapView,
      builder: (context, state) {
        final data = state.extra as LatLngModel;
        return ViewLocation(latLng: data);
      },
    ),
    GoRoute(
      path: RoutePaths.searchLocation,
      builder: (context, state) {
        return const SearchLocation();
      },
    ),
  ],
);
