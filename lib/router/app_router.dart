import 'package:complex_data_management/auth/user_auth.dart';
import 'package:complex_data_management/screens/home_screen_state.dart';
import 'package:complex_data_management/screens/login_screen_state.dart';
import 'package:complex_data_management/screens/profile_screen_state.dart';
import 'package:go_router/go_router.dart';

// ignore: non_constant_identifier_names
final GoRouter AppRouter = GoRouter(
  initialLocation: '/login',
  redirect: (context, state) {
    if (!UserAuth.isLoggedIn && state.uri.path != '/login') {
      return '/login';
    } else if (UserAuth.isLoggedIn && state.uri.path == '/login') {
      return '/home';
    }
    return null;
  },
  routes: [
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
  ],
);
