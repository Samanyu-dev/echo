import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appwrite/appwrite.dart';
import '../domain/event.dart';
import '../../../core/constants/appwrite_constants.dart';

final appwriteClientProvider = Provider((ref) {
  Client client = Client();
  client
      .setEndpoint(AppwriteConstants.endpoint)
      .setProject(AppwriteConstants.projectId)
      .setSelfSigned(status: true);
  return client;
});

class EventRepository {
  final Databases _databases;

  EventRepository(this._databases);

  Future<List<Event>> getUpcomingEvents() async {
    try {
      final response = await _databases.listDocuments(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.eventsCollectionId,
        queries: [
          Query.orderAsc('date_time'),
        ],
      );
      
      return response.documents.map((doc) => Event.fromJson(doc.data)).toList();
    } catch (e) {
      print('Appwrite error: $e. Falling back to mock data.');
      await Future.delayed(const Duration(seconds: 1));
      
      return [
        Event(
          id: '1',
          title: 'Housewarming Party',
          description: "We've just moved to New York! And warmer weather means housewarming!",
          dateTime: DateTime(2026, 9, 19, 12, 0),
          location: 'Brooklyn, NY',
          coverImageUrl: 'https://images.unsplash.com/photo-1511795409834-ef04bbd61622',
          hostId: 'host1',
          guestIds: ['g1', 'g2', 'g3'],
          privacy: 'Invite Only',
        ),
        Event(
          id: '2',
          title: 'Tyler Turns 3!',
          description: "Celebrating Tyler's 3rd birthday with cake and fun!",
          dateTime: DateTime(2026, 6, 14, 15, 0),
          location: 'Chicago, IL',
          coverImageUrl: 'https://images.unsplash.com/photo-1530103043960-ef38714abb15',
          hostId: 'host1',
          guestIds: ['g1', 'g4'],
          privacy: 'Private',
        ),
      ];
    }
  }

  Future<void> createEvent(Event event) async {
    try {
      await _databases.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.eventsCollectionId,
        documentId: ID.unique(),
        data: event.toJson(),
      );
    } catch (e) {
      print('Appwrite create error: $e');
      throw e;
    }
  }
}

final eventRepositoryProvider = Provider((ref) {
  final client = ref.watch(appwriteClientProvider);
  return EventRepository(Databases(client));
});

final upcomingEventsProvider = FutureProvider<List<Event>>((ref) async {
  final repository = ref.watch(eventRepositoryProvider);
  return repository.getUpcomingEvents();
});

final createEventProvider = AsyncNotifierProvider<CreateEventNotifier, void>(() {
  return CreateEventNotifier();
});

class CreateEventNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {
    return;
  }

  Future<void> createEvent(Event event) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(eventRepositoryProvider);
      await repository.createEvent(event);
      ref.invalidate(upcomingEventsProvider);
    });
  }
}
