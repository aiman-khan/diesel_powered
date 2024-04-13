import 'package:calculator_flutter_app/features/auth/presentation/views/forget_password/forgot_password_view.dart';
import 'package:calculator_flutter_app/features/auth/presentation/views/login/login_view.dart';
import 'package:calculator_flutter_app/features/auth/presentation/views/otp_verification/otp_verification_view.dart';
import 'package:calculator_flutter_app/features/auth/presentation/views/profile/profile_view.dart';
import 'package:calculator_flutter_app/features/auth/presentation/views/register/sign_up_view.dart';
import 'package:calculator_flutter_app/features/auth/presentation/views/reset_password/reset_password.dart';
import 'package:calculator_flutter_app/features/calculator/presentation/views/calculate_item/calculate_item_view.dart';
import 'package:calculator_flutter_app/features/contact/presentation/views/add_contact/add_contact_view.dart';
import 'package:calculator_flutter_app/features/contact/presentation/views/contact_list/contact_list_view.dart';
import 'package:calculator_flutter_app/features/google_maps/domain/models/lat_lng/lat_lng_model.dart';
import 'package:calculator_flutter_app/features/google_maps/presentation/views/search_location.dart';
import 'package:calculator_flutter_app/features/google_maps/presentation/views/view_location.dart';
import 'package:calculator_flutter_app/features/home/presentation/views/home_view.dart';
import 'package:calculator_flutter_app/features/premium/presentation/views/add_card/add_card_view.dart';
import 'package:calculator_flutter_app/features/premium/presentation/views/payment_method/payment_method_view.dart';
import 'package:calculator_flutter_app/features/quote/presentation/views/quotes/quotes_view.dart';
import 'package:calculator_flutter_app/features/splash/presentation/splash_view.dart';
import 'package:calculator_flutter_app/util/router/paths.dart';
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
      path: RoutePaths.profile,
      builder: (context, state) {
        return const ProfileView();
      },
    ),
    // GoRoute(
    //   path: RoutePaths.mapView,
    //   builder: (context, state) {
    //     final data = state.extra as LatLngModel;
    //     return ViewLocation(latLng: data);
    //   },
    // ),
    // GoRoute(
    //   path: RoutePaths.searchLocation,
    //   builder: (context, state) {
    //     return const SearchLocation();
    //   },
    // ),
    GoRoute(
      path: RoutePaths.quotes,
      builder: (context, state) {
        return const QuotesView();
      },
    ),
    GoRoute(
      path: RoutePaths.calculateItem,
      builder: (context, state) {
        final data = state.extra as String;
        return CalculateItemView(title: data);
      },
    ),
    GoRoute(
      path: RoutePaths.paymentMethod,
      builder: (context, state) {
        return const PaymentMethodView();
      },
    ),
    GoRoute(
      path: RoutePaths.addCard,
      builder: (context, state) {
        return const AddCardView();
      },
    ),
    GoRoute(
      path: RoutePaths.addContact,
      builder: (context, state) {
        return const AddContactView();
      },
    ),
    GoRoute(
      path: RoutePaths.contactList,
      builder: (context, state) {
        return const ContactListView();
      },
    ),
  ],
);
