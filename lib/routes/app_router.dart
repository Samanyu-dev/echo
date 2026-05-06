import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/events/presentation/home_screen.dart';
import '../features/events/presentation/create_event_screen.dart';
import '../features/events/presentation/event_details_screen.dart';
import '../features/profile/presentation/profile_screen.dart';

import '../features/expenses/presentation/expense_screen.dart';
import '../features/events/presentation/shared_album_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'create-event',
          builder: (context, state) => const CreateEventScreen(),
        ),
        GoRoute(
          path: 'event/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return EventDetailsScreen(eventId: id);
          },
          routes: [
            GoRoute(
              path: 'expenses',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return ExpenseScreen(eventId: id);
              },
            ),
            GoRoute(
              path: 'album',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return SharedAlbumScreen(eventId: id);
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);
