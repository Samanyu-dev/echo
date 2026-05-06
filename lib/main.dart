import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appwrite/appwrite.dart';
import 'core/theme/app_theme.dart';
import 'routes/app_router.dart';
import 'core/constants/appwrite_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  Client client = Client();
  client
    .setEndpoint(AppwriteConstants.endpoint)
    .setProject(AppwriteConstants.projectId)
    .setSelfSigned(status: true);

  runApp(
    const ProviderScope(
      child: AppleInvitesApp(),
    ),
  );
}

class AppleInvitesApp extends StatelessWidget {
  const AppleInvitesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Apple Invites',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: appRouter,
    );
  }
}
