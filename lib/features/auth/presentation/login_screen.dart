import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import 'package:appwrite/appwrite.dart';
import '../../../config/environment.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF1A1A1A),
                  Colors.black,
                ],
              ),
            ),
          ),
          
          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  
                  // App Icon / Logo Placeholder
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.accent.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.celebration,
                      size: 50,
                      color: Colors.white,
                    ),
                  ).animate().scale(delay: 200.ms, duration: 600.ms, curve: Curves.easeOutBack),
                  
                  const SizedBox(height: 40),
                  
                  Text(
                    'Apple Invites',
                    style: Theme.of(context).textTheme.displayLarge,
                  ).animate().fadeIn(delay: 400.ms).moveY(begin: 20, end: 0),
                  
                  const SizedBox(height: 12),
                  
                  Text(
                    'Create beautiful invitations for all your events. Anyone can receive invitations.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ).animate().fadeIn(delay: 600.ms).moveY(begin: 20, end: 0),
                  
                  const Spacer(),
                  
                  // Login Buttons
                  ElevatedButton(
                    onPressed: () => context.go('/'),
                    child: const Text('Continue with Apple'),
                  ).animate().fadeIn(delay: 800.ms).scale(begin: const Offset(0.9, 0.9)),
                  
                  const SizedBox(height: 16),
                  
                  OutlinedButton(
                    onPressed: () async {
                      try {
                        final client = Client()
                          .setEndpoint(Environment.appwritePublicEndpoint)
                          .setProject(Environment.appwriteProjectId);
                        await Account(client).get();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Ping Success! Connection Verified.')),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Ping Result (expected 401): $e')),
                        );
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 56),
                      side: BorderSide(color: Colors.white.withOpacity(0.2)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Text(
                      'Send a ping',
                      style: TextStyle(color: Colors.white),
                    ),
                  ).animate().fadeIn(delay: 1000.ms),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
