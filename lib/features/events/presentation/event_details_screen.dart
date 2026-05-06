import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class EventDetailsScreen extends StatelessWidget {
  final String eventId;
  const EventDetailsScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Hero Header
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => context.pop(),
            ),
            actions: [
              IconButton(icon: const Icon(Icons.calendar_today), onPressed: () {}),
              IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://images.unsplash.com/photo-1511795409834-ef04bbd61622",
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Housewarming Party',
                    style: Theme.of(context).textTheme.displayMedium,
                  ).animate().fadeIn().moveY(begin: 10, end: 0),
                  
                  const SizedBox(height: 8),
                  
                  Text(
                    'Fri 19 September at 12:00',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.accent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  
                  Text(
                    '1559 Audubon Ave, New York, NY',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // RSVP Buttons
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                      children: [
                        _RSVPButton(
                          label: 'Going',
                          icon: Icons.check_circle,
                          isSelected: true,
                          onTap: () {},
                        ),
                        _RSVPButton(
                          label: 'Not Going',
                          icon: Icons.cancel,
                          isSelected: false,
                          onTap: () {},
                        ),
                        _RSVPButton(
                          label: 'Maybe',
                          icon: Icons.help,
                          isSelected: false,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ).animate().fadeIn(delay: 200.ms),
                  
                  const SizedBox(height: 32),
                  
                  // Description Card
                  _DetailCard(
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=host'),
                        ),
                        const SizedBox(height: 8),
                        const Text('Hosted by Alan Ferrari'),
                        const SizedBox(height: 16),
                        Text(
                          "We've just moved to New York! And warmer weather means housewarming!\n\nWe'll have light refreshments, drinks and BBQing in the evening. Stop by to hang out, catch up and friends meet friends!",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(delay: 400.ms),
                  
                  const SizedBox(height: 16),
                  
                  // Guest List Summary
                  _DetailCard(
                    child: Column(
                      children: [
                        const Text('12 Going', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 60,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 8,
                            separatorBuilder: (context, index) => const SizedBox(width: 12),
                            itemBuilder: (context, index) => const CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=guest'),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text('Can\'t wait to be there!', style: TextStyle(fontSize: 14, color: AppColors.textSecondary)),
                        const Text('Jenica', style: TextStyle(fontSize: 12, color: AppColors.textTertiary)),
                      ],
                    ),
                  ).animate().fadeIn(delay: 600.ms),
                  
                  const SizedBox(height: 16),
                  
                  // Shared Album Preview
                  _DetailCard(
                    child: Column(
                      children: [
                        const Text('Shared Album', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(child: _AlbumImage(url: "https://images.unsplash.com/photo-1511795409834-ef04bbd61622")),
                            const SizedBox(width: 8),
                            Expanded(child: _AlbumImage(url: "https://images.unsplash.com/photo-1530103043960-ef38714abb15")),
                            const SizedBox(width: 8),
                            Expanded(child: _AlbumImage(url: "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b")),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => context.go('/event/$eventId/album'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.surface,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('View All Photos'),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(delay: 800.ms),
                  
                  // Collaborative Tools Section
                  const SizedBox(height: 32),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'COLLABORATIVE TOOLS',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textSecondary.withOpacity(0.5),
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  _CollaborativeToolTile(
                    icon: Icons.account_balance_wallet_outlined,
                    label: 'Split Expenses',
                    subtitle: 'Manage shared bills & settlements',
                    onTap: () => context.go('/event/$eventId/expenses'),
                  ).animate().fadeIn(delay: 700.ms),
                  
                  _CollaborativeToolTile(
                    icon: Icons.checklist_rtl_outlined,
                    label: 'To-Do List',
                    subtitle: 'Tasks & assignments for guests',
                    onTap: () {},
                  ).animate().fadeIn(delay: 800.ms),
                  
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CollaborativeToolTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final VoidCallback onTap;

  const _CollaborativeToolTile({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        tileColor: AppColors.surface.withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.accent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.accent),
        ),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
        trailing: const Icon(Icons.chevron_right, color: AppColors.textTertiary),
      ),
    );
  }
}

class _RSVPButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _RSVPButton({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 20,
                color: isSelected ? Colors.black : AppColors.textSecondary,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.black : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailCard extends StatelessWidget {
  final Widget child;
  const _DetailCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
      ),
      child: child,
    );
  }
}

class _AlbumImage extends StatelessWidget {
  final String url;
  const _AlbumImage({required this.url});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(url, fit: BoxFit.cover),
      ),
    );
  }
}
