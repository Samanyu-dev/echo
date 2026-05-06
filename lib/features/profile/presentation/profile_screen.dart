import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient / Image Blur
          Positioned.fill(
            child: Image.network(
              'https://i.pravatar.cc/600?u=me',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: Container(
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
          
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                expandedHeight: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                  onPressed: () => context.pop(),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () {},
                  ),
                ],
              ),
              
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      
                      // Profile Avatar with Glow
                      Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.accent, width: 2),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.accent.withOpacity(0.3),
                                    blurRadius: 30,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                            ),
                            const CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage('https://i.pravatar.cc/300?u=me'),
                            ),
                          ],
                        ),
                      ).animate().scale(duration: 600.ms, curve: Curves.easeOutBack),
                      
                      const SizedBox(height: 24),
                      
                      Text(
                        'Samanyu',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ).animate().fadeIn(delay: 200.ms),
                      
                      Text(
                        'samanyu1808@gmail.com',
                        style: TextStyle(color: AppColors.textSecondary.withOpacity(0.7)),
                      ).animate().fadeIn(delay: 300.ms),
                      
                      const SizedBox(height: 32),
                      
                      // Stats Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _StatItem(label: 'Events', value: '24'),
                          _StatItem(label: 'Hosting', value: '8'),
                          _StatItem(label: 'RSVPs', value: '112'),
                        ],
                      ).animate().fadeIn(delay: 400.ms).moveY(begin: 20, end: 0),
                      
                      const SizedBox(height: 40),
                      
                      // Premium Card
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: AppColors.highlightGradient,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.accent.withOpacity(0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.stars, color: Colors.white, size: 32),
                            const SizedBox(width: 16),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'iCloud+ Included',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                  Text(
                                    'Sending premium invitations',
                                    style: TextStyle(color: Colors.white70, fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right, color: Colors.white70),
                          ],
                        ),
                      ).animate().fadeIn(delay: 500.ms).scale(begin: const Offset(0.9, 0.9)),
                      
                      const SizedBox(height: 40),
                      
                      // Settings Sections
                      _SectionHeader(title: 'PREFERENCES'),
                      _ProfileTile(icon: Icons.notifications_active_outlined, label: 'Notifications', color: Colors.orange),
                      _ProfileTile(icon: Icons.lock_person_outlined, label: 'Privacy & Security', color: Colors.green),
                      _ProfileTile(icon: Icons.calendar_month_outlined, label: 'Calendar Sync', color: Colors.blue),
                      
                      const SizedBox(height: 24),
                      
                      _SectionHeader(title: 'SUPPORT'),
                      _ProfileTile(icon: Icons.help_outline, label: 'Help Center', color: Colors.purple),
                      _ProfileTile(icon: Icons.info_outline, label: 'About Apple Invites', color: Colors.grey),
                      
                      const SizedBox(height: 40),
                      
                      // Logout
                      GestureDetector(
                        onTap: () => context.go('/login'),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.red.withOpacity(0.2)),
                          ),
                          child: const Center(
                            child: Text(
                              'Sign Out',
                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ),
                      ).animate().fadeIn(delay: 700.ms),
                      
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.textSecondary.withOpacity(0.5),
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _ProfileTile({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        title: Text(label, style: const TextStyle(fontSize: 16)),
        trailing: const Icon(Icons.chevron_right, color: AppColors.textTertiary, size: 20),
        onTap: () {},
      ),
    );
  }
}
