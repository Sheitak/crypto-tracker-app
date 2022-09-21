import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/providers/app_provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Text(
              'CryptoTrackerApp',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.house),
            onTap: () => {
              Navigator.pushNamed(context, '/home')
            },
            title: const Text('Home'),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            onTap: () => {
              Navigator.pushNamed(context, '/profile')
            },
            title: const Text('Profile'),
          ),
          ListTile(
            leading: const Icon(Icons.star),
            onTap: () => {
              Navigator.pushNamed(context, '/favorites')
            },
            title: const Text('Favorites'),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            onTap: () => {
              Navigator.pushNamed(context, '/settings')
            },
            title: const Text('Settings'),
          ),
          ListTile(
            leading: const Icon(Icons.support_agent),
            onTap: () => {
              Navigator.pushNamed(context, '/support')
            },
            title: const Text('Support'),
          ),
          ListTile(
            leading: const Icon(Icons.assignment_outlined),
            onTap: () => {
              Navigator.pushNamed(context, '/about')
            },
            title: const Text('About'),
          ),
          Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return Container(
                  padding: const EdgeInsets.only(top: 48.0),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () => ref.watch(firebaseAuthenticationProvider).signOut(context),
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
                );
              }
          ),
        ],
      ),
    );
  }
}