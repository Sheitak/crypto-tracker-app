import 'package:crypto_tracker_app/data/datasources/remote/cloud_firestore_database.dart';
import 'package:crypto_tracker_app/data/datasources/remote/crypto_remote_data_source_impl.dart';
import 'package:crypto_tracker_app/data/datasources/remote/firebase_authentication.dart';
import 'package:crypto_tracker_app/presentation/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/providers/app_provider.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportState();
}
class _SupportState extends State<SupportScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Support : Open Ticket'),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/create-ticket-support')
                  },
                  child: Text('Create New Ticket'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/tickets')
                  },
                  child: Text('Your Tickets'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}