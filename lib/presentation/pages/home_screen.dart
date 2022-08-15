import 'package:crypto_tracker_app/presentation/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/providers/app_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Besoin d'une déconnexion peu importe l'endroit.
    // first variable is to get the data of Authenticated User
    // final data = ref.watch(fireBaseAuthProvider);

    //  Second variable to access the Logout Function
    // final auth = ref.watch(authenticationProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Tracker App'),
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
      // backgroundColor: Colors.blueGrey[500],
      // drawer: _buildDrawerWidget(context),
      drawer: DrawerWidget(context),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {

          final data = ref.watch(fireBaseAuthProvider);
          // final data1 = ref.watch(apiAuthenticationProvider).getAuthenticateUser(userEmail);
          // print(data1);

          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Glad to see you here, ${data.currentUser!.email}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          data.currentUser!.displayName ?? 'Great you have Completed this step',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15
                          ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {
                        Navigator.pushNamed(context, '/cryptocurrencies')
                      },
                      child: const Text(
                        'View All Cryptocurrencies',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {
                        Navigator.pushNamed(context, '/create-support-ticket')
                      },
                      child: const Text(
                        'Submit Ticket',
                        style: TextStyle(
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 48.0),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () => ref.watch(firebaseAuthenticationProvider).signOut(),
                    textColor: Colors.blue.shade700,
                    textTheme: ButtonTextTheme.primary,
                    minWidth: 100,
                    padding: const EdgeInsets.all(18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(color: Colors.blue.shade700),
                    ),
                    child: const Text(
                      'Log Out',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}