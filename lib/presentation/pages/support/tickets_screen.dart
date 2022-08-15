import 'package:crypto_tracker_app/core/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:crypto_tracker_app/presentation/widgets/error.dart';
import 'package:intl/intl.dart';

import '../../../core/error/failures.dart';
import '../../../core/providers/ticket_provider.dart';
import '../../../data/datasources/remote/cloud_firestore_database.dart';
import '../../widgets/drawer.dart';
import '../../widgets/favorites_widget.dart';
import '../../widgets/status_badge.dart';
import '../loading_screen.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Support : Your Submit Tickets'),
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
        body: const _BuildBodyListTicketsWidget()
        // body: const CustomScrollView(
        //   slivers: [
        //     _BuildBodyListTicketsWidget()
        //   ],
        // )
    );
  }

}

class _BuildBodyListTicketsWidget extends ConsumerWidget {
  const _BuildBodyListTicketsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getTicketsByUserProvider).when(
        data: (tickets) => ListView.builder(
            itemCount: tickets.length,
            itemBuilder: (context, index) {
              final DateTime lastUpdateTicket = DateTime.parse(tickets[index]['updatedAt']);
              if (tickets.isEmpty) {
                return const Center(
                  child: Text(
                    'You have never submitted tickets before',
                    style: TextStyle(
                      fontWeight: FontWeight.w300
                  ),
                  )
                );
              }
              // print(tickets);
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context, '/ticket',
                    arguments: tickets[index]['uid']
                  );
                },
                child: Card(
                  margin: const EdgeInsets.all(0.6),
                  elevation: 8.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.ticketSimple,
                            color: Colors.indigo.shade600,
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                            // padding: const EdgeInsets.only(left: 20.0),
                            child: SizedBox(
                            width: 250,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 2.0, top: 6.0),
                                    child: Text(
                                      "Object : ${tickets[index]['object']}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 6.0, top: 2.0),
                                    child: Text(
                                      'Last Updated : ${DateFormat.yMMMd()
                                        .add_jm()
                                        .format(lastUpdateTicket)}',
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 14
                                      ),
                                    ),
                                  )
                                ],
                              ),
                          ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0, bottom: 8.0, top: 8.0),
                                  // child: StatusBadge(tickets[index]['status'])
                                  child: StatusBadge(status: tickets[index]['status'])
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
        ),
        loading: () => const Center(
            child: CircularProgressIndicator()
        ),
        error: (error, _) => Error(
            message: error.toString(),
            callback: () => {}
        )
    );
  }
}