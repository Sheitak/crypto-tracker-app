import 'package:crypto_tracker_app/presentation/widgets/status_badge.dart';
import 'package:flutter/material.dart';
import 'package:crypto_tracker_app/core/providers/ticket_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:crypto_tracker_app/presentation/widgets/error.dart';
import '../../widgets/drawer.dart';

class TicketsDetailsScreen extends ConsumerWidget {
  final String ticketId;
  const TicketsDetailsScreen({Key? key, required this.ticketId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getTicketByUid(ticketId)).when(
        data: (ticket) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: Text('N° : ${ticket['uid']}' ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () => {
                      Navigator.pushNamed(context, '/wallet')
                    },
                    icon: const Icon(Icons.account_balance_wallet_outlined),
                  )
                ],
              ),
              drawer: DrawerWidget(context),
              body: Padding(
                  padding: const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SizedBox(
                            //     width: MediaQuery.of(context).size.height / 3,
                            //     child: Text(ticket['uid'])
                            // ),
                            Container(height: 10),
                            Text('Object : ${ticket['object']}'),
                            StatusBadge(status: ticket['status']),
                            Text('Message : ${ticket['message']}'),
                            Text('CreatedAt : ${ticket['createdAt']}'),
                            Text('UpdatedAt : ${ticket['updatedAt']}'),
                          ],
                        ),
                      )
                    ],
                  )
              )
          );
        },
        error: (error, _) => Error(message: error.toString(), callback: () => {}),
        loading: () => const Center(child: CircularProgressIndicator())
    );
  }
}