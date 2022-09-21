import 'package:crypto_tracker_app/presentation/pages/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthentication {
  // Pour les fonctions liées à l'authentification, vous avez besoin d'une instance de FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // User _userFromFirebaseUser(FirebaseUser user) {
  //   return user != null ? User(uid: user.uid):null;
  // }

  // Ce getter renverra un objet Stream of User.
  // Il sera utilisé pour vérifier si l'utilisateur est connecté ou non.
  Stream<User?> get authStateChange => _auth.authStateChanges();

  // Maintenant, cette classe contient 3 fonctions actuellement
  // 1. se connecterAvecGoogle
  // 2. déconnexion
  // 3. se connecteravecEmailEtMotDePasse

  // Toutes ces fonctions sont asynchrones car cela implique un futur.
  // si le mot-clé async n'est pas utilisé, une erreur sera générée.
  // pour en savoir plus sur les contrats à terme, consultez la documentation.
  // https://dart.dev/codelabs/async-await
  // Lisez ceci pour en savoir plus sur les contrats à terme.
  // Croyez-moi, cela effacera vraiment tous vos concepts sur les contrats à terme

  //  SigIn the user using Email and Password
  Future<void> signInWithEmailAndPassword(String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error Occured'),
          content: Text(e.toString()),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text("OK"))
          ],
        ),
      );
    }
  }

  Future<void> signUpWithEmailAndPassword(String email, String password, BuildContext context) async {
    try {
      _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: const Text('Error Occured'),
              content: Text(e.toString()),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text("OK"))
              ]));
    } catch (e) {
      if (e == 'email-already-in-use') {
        print('Email already in use.');
      } else {
        print('Error: $e');
      }
    }
  }

  Future<void> sendPasswordResetEmail(String email, BuildContext context) async {
    try {
      _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: const Text('Error Occured'),
              content: Text(e.toString()),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text("OK"))
              ]));
    } catch (e) {
      if (e == 'email-already-in-use') {
        print('Email already in use.');
      } else {
        print('Error: $e');
      }
    }
  }

  //  SignIn the user Google
  Future<void> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    try {
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      await showDialog(
        context: context,
        // ctx
        builder: (context) => AlertDialog(
          title: const Text('Error Occured'),
          content: Text(e.toString()),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"))
          ],
        ),
      );
    }
  }

  //  SignOut the current user
  Future<void> signOut(context) async {
    // await _auth.signOut();
    await _auth.signOut().then((value) => Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder:
            (context) => const LoginScreen()),
            (route) => false
    ));
    // _googleSignIn.signOut()
  }
}