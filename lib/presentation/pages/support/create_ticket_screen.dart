import 'package:crypto_tracker_app/data/datasources/remote/cloud_firestore_database.dart';
import 'package:crypto_tracker_app/data/datasources/remote/crypto_remote_data_source_impl.dart';
import 'package:crypto_tracker_app/data/datasources/remote/firebase_authentication.dart';
import 'package:crypto_tracker_app/presentation/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/providers/app_provider.dart';

class CreateTicketScreen extends StatefulWidget {
  const CreateTicketScreen({Key? key}) : super(key: key);

  @override
  State<CreateTicketScreen> createState() => _CreateTicketState();
}
class _CreateTicketState extends State<CreateTicketScreen> {
  final textObjectController = TextEditingController();
  final textMessageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    textObjectController.dispose();
    textMessageController.dispose();
    super.dispose();
  }

  Future<void> _submit(authFirebase) async {
    Map<String, dynamic> parameters = {
      'username': authFirebase.currentUser!.displayName,
      'email': authFirebase.currentUser!.email,
      'object': textObjectController.text,
      'message': textMessageController.text,
      'status': 'pending',
      'updatedAt': DateTime.now().toString(),
      'createdAt': DateTime.now().toString()
    };
    // print(parameters);
    // TODO: Injecter ici vers RealTimeDatabase/Firestore
    CloudFirestoreDatabase().createTicket(parameters);
    // CryptoRemoteDataSourceImpl().postTicket(parameters);
  }

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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    'Please specify the subject of your request and be as clear as possible. '
                    'For bugs and feature requests, we will listen to you and contact you as soon as possible.'
                ),
              ),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final authFirebase = ref.watch(fireBaseAuthProvider);
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Object',
                                border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.text,
                            controller: textObjectController,
                            validator: (value) {
                              if (value != null && value.length >= 120) {
                                return 'Your object must contain only 120 characters maximum';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Your message',
                                border: OutlineInputBorder()
                            ),
                            keyboardType: TextInputType.text,
                            controller: textMessageController,
                            validator: (value) {
                              if (value != null && value.length >= 120) {
                                return 'Your message must contain only 120 characters maximum';
                              }
                              return null;
                            },
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _submit(authFirebase);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text('Processing Data... Message send !')
                                ),
                              );
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}