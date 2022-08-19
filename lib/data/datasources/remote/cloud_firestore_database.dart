import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreDatabase {
  final FirebaseFirestore _cloudFirestore = FirebaseFirestore.instance;

  Future<void> createTicket(Map<String, dynamic> parameters) async {
    await _cloudFirestore.collection("tickets").add(parameters);
  }

  List<dynamic> getAllTickets() {
    _cloudFirestore.collection("tickets").get().then((event) {
      List<dynamic> tickets = [];
      for (var doc in event.docs) {
        tickets.add(doc.data());
      }
      return tickets;
    });
    return [];
  }

  Stream get allTickets => _cloudFirestore.collection("tickets").snapshots();

  Future<List> getTicketsByUser(String? email) async {
    final snap = await _cloudFirestore.collection("tickets").where("email", isEqualTo: email).get();
    List<dynamic> tickets = [];
    for (var doc in snap.docs) {
      final uid = {'uid': doc.id};
      final data = doc.data();
      data.addEntries(uid.entries);
      tickets.add(data);
    }
    return tickets;
  }

  Future<Map> getTicketByUid(String uid) async {
    final doc = await _cloudFirestore.collection("tickets").doc(uid).get();
    final ticketId = {'uid': doc.id};
    final ticket = doc.data();
    ticket?.addEntries(ticketId.entries);
    return ticket ?? {};
  }
}