import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../application/event_service.dart';
import '../domain/event.dart';

class CreateEventScreen extends ConsumerStatefulWidget {
  const CreateEventScreen({super.key});

  @override
  ConsumerState<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends ConsumerState<CreateEventScreen> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final createStatus = ref.watch(createEventProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
        title: const Text('New Event'),
        actions: [
          createStatus.maybeWhen(
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)),
              ),
            ),
            orElse: () => TextButton(
              onPressed: () async {
                if (_titleController.text.isEmpty) return;
                
                final event = Event(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  title: _titleController.text,
                  description: _descController.text,
                  dateTime: DateTime.now().add(const Duration(days: 7)),
                  location: 'New York, NY',
                  coverImageUrl: 'https://images.unsplash.com/photo-1511795409834-ef04bbd61622',
                  hostId: 'me',
                  guestIds: [],
                  privacy: 'Invite Only',
                );

                await ref.read(createEventProvider.notifier).createEvent(event);
                
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Event Created Successfully!')),
                  );
                  context.pop();
                }
              },
              child: const Text(
                'Create',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: AppColors.accent,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Media Picker Placeholder
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_photo_alternate_outlined, size: 48, color: AppColors.textSecondary),
                    const SizedBox(height: 12),
                    Text(
                      'Add Cover Photo or Video',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: 'Event Title',
              ),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            
            const SizedBox(height: 16),
            
            const _FormRow(
              icon: Icons.calendar_today_outlined,
              label: 'Date & Time',
              value: 'Select...',
            ),
            
            const _FormRow(
              icon: Icons.location_on_outlined,
              label: 'Location',
              value: 'Add Address',
            ),
            
            const _FormRow(
              icon: Icons.lock_outline,
              label: 'Privacy',
              value: 'Invite Only',
            ),
            
            const SizedBox(height: 32),
            
            Text(
              'Description',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            
            const SizedBox(height: 12),
            
            TextField(
              controller: _descController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'What\'s the occasion?',
                alignLabelWithHint: true,
              ),
            ),
            
            const SizedBox(height: 32),
            
            const Text(
              'GUESTS',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary,
                letterSpacing: 1,
              ),
            ),
            
            const SizedBox(height: 12),
            
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person_add_outlined, color: AppColors.accent),
              ),
              title: const Text('Invite Guests'),
              subtitle: const Text('Select from contacts or share link'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _FormRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _FormRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: AppColors.textSecondary),
            const SizedBox(width: 16),
            Text(label, style: const TextStyle(color: Colors.white)),
            const Spacer(),
            Text(
              value,
              style: const TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right, size: 16, color: AppColors.textTertiary),
          ],
        ),
      ),
    );
  }
}
