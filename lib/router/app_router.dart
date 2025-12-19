import 'package:complex_data_management/screens/home_screen_state.dart';
import 'package:complex_data_management/screens/login_screen_state.dart';
import 'package:complex_data_management/screens/profile_screen_state.dart';
import 'package:go_router/go_router.dart';

// ignore: non_constant_identifier_names
final GoRouter AppRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
  ],
);
