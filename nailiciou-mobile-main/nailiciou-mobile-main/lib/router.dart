import 'package:go_router/go_router.dart';
import 'package:nailicious_mobile/pages/auth/widget.dart';
import 'package:nailicious_mobile/pages/booking/widget.dart';
import 'package:nailicious_mobile/pages/confirm/widget.dart';
import 'package:nailicious_mobile/pages/history/widget.dart';
import 'package:nailicious_mobile/pages/main/widget.dart';
import 'package:nailicious_mobile/pages/profile/widget.dart';

final router = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const AuthPageWidget(),
  ),
  GoRoute(
    path: '/confirm',
    builder: (context, state) => const ConfirmPageWidget(),
  ),
  GoRoute(
    path: '/main',
    builder: (context, state) => const MainPageWidget(),
  ),
  GoRoute(
    path: "/booking",
    builder: (context, state) => const BookingPageWidget(),
  ),
  GoRoute(
    path: "/history",
    builder: (context, state) => BookingHistoryWidget(),
  ),
  GoRoute(
    path: "/profile",
    builder: (context, state) => ProfilePageWidget(),
  )
]);
