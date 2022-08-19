import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/datasources/remote/cloud_firestore_database.dart';
import 'app_provider.dart';

final getTicketsByUserProvider = FutureProvider.autoDispose<List>((ref) async {
  final String? email = ref.watch(firebaseAuthProvider).currentUser?.email;
  return await ref.read(cloudFirestoreDatabaseProvider).getTicketsByUser(email);
});

final getTicketByUid = FutureProvider.autoDispose.family<Map, String>((ref, ticketId) async {
  return await ref.read(cloudFirestoreDatabaseProvider).getTicketByUid(ticketId);
});

final getAllTicketProvider = StreamProvider((ref) {
    return ref.read(cloudFirestoreDatabaseProvider).allTickets;
});

final createTicketProvider = FutureProvider.autoDispose.family<void, Map<String, dynamic>>((ref, parameters) async {
  return await ref.read(cloudFirestoreDatabaseProvider).createTicket(parameters);
});