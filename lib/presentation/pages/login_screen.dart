
import 'package:crypto_tracker_app/presentation/pages/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/providers/app_provider.dart';

// Au lieu de créer deux écrans, j'ai ajouté à la fois l'écran de connexion et d'inscription sur un seul écran
// Oui, je suis paresseux, mais je ne vais pas créer deux écrans, je vais créer un écran

// Donc, pour surveiller, nous sommes dans quel état nous sommes, c'est-à-dire Connexion ou inscription, j'ai utilisé des énumérations ici
// J'ai donc créé un Enum Status qui contient deux choses Login et SignUp

// et j'ai créé un statut de type Variable globale, à utiliser dans LoginPage
// Il n'est en fait pas recommandé d'utiliser Global Variables , mais je l'utilise ici pour simplifier
// Le motif principal ici était d'enseigner l'authentification Firebase en utilisant Riverpod comme gestion d'état

enum Status {
  login,
  signUp,
}

// Variable global n'est pas une bonne pratique.
// Status type = Status.login;

// J'ai utilisé un widget avec état pour utiliser les fonctions setstate dans LoginPage
// nous pourrions également gérer l'état en utilisant Riverpod mais je ne l'utilise pas ici
// Rappelez-vous que les widgets avec état sont créés pour une raison. Si ce serait mal le développeur flutter n'y penserait pas en premier lieu.

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Status type = Status.login;

  // TextEditingController pour obtenir les données des TextFields
  // on peut aussi utiliser Riverpod pour gérer l'état des TextFields
  // mais encore une fois je ne l'utilise pas ici
  final _email = TextEditingController();
  final _password = TextEditingController();

  // Une variable de chargement pour afficher l'animation de chargement lorsqu'une fonction est en cours
  bool _isLoading = false;
  bool _isLoading2 = false;

  void loading() {
    if (mounted) {
      setState(() {
        _isLoading = !_isLoading;
      });
    }
  }

  void loading2() {
    if (mounted) {
      setState(() {
        _isLoading2 = !_isLoading2;
      });
    }
  }

  void _switchType() {
    if (type == Status.signUp) {
      setState(() {
        type = Status.login;
      });
    } else {
      setState(() {
        type = Status.signUp;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Consumer(builder: (context, ref, child) {
          final auth = ref.watch(firebaseAuthenticationProvider);
          Future<void> _onPressedFunction() async {
            if (!_formKey.currentState!.validate()) {
              return;
            }
            if (type == Status.login) {
              loading();
              await auth.signInWithEmailAndPassword(_email.text, _password.text, context)
                  .whenComplete(() => auth.authStateChange.listen((event) async {
                    if (event == null) {
                      loading();
                      return;
                    }
                  }));
            } else {
              loading();
              await auth.signUpWithEmailAndPassword(_email.text, _password.text, context)
                  .whenComplete(() => auth.authStateChange.listen((event) async {
                    if (event == null) {
                      loading();
                      return;
                    }
                  }));
            }
          }

          // Future<void> _resetPassword() async {

          Future<void> _loginWithGoogle() async {
            loading2();
            await auth.signInWithGoogle(context)
                .whenComplete(() => auth.authStateChange.listen((event) async {
              if (event == null) {
                loading2();
                return;
              }
            }));
          }

          return Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(top: 48),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(child: FlutterLogo(size: 81)),
                        const Spacer(flex: 1),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          child: TextFormField(
                            controller: _email,
                            autocorrect: true,
                            enableSuggestions: true,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {},
                            decoration: InputDecoration(
                              hintText: 'Email address',
                              hintStyle: const TextStyle(color: Colors.black54),
                              icon: Icon(
                                  Icons.email_outlined,
                                  color: Colors.blue.shade700, size: 24
                              ),
                              alignLabelWithHint: true,
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Invalid email!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 8
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)
                          ),
                          child: TextFormField(
                            controller: _password,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return 'Password is too short!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: const TextStyle(color: Colors.black54),
                              icon: Icon(CupertinoIcons.lock_circle,
                                  color: Colors.blue.shade700,
                                  size: 24
                              ),
                              alignLabelWithHint: true,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        if (type == Status.signUp)
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 600),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 8
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 4
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)
                            ),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Confirm password',
                                hintStyle:
                                const TextStyle(color: Colors.black54),
                                icon: Icon(CupertinoIcons.lock_circle,
                                    color: Colors.blue.shade700,
                                    size: 24
                                ),
                                alignLabelWithHint: true,
                                border: InputBorder.none,
                              ),
                              validator: type == Status.signUp
                                ? (value) {
                                    if (value != _password.text) {
                                      return 'Passwords do not match!';
                                    }
                                    return null;
                                  }
                                : null,
                            ),
                          ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 32.0),
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            width: double.infinity,
                            child: _isLoading
                                ? const Center(
                                child: CircularProgressIndicator())
                                : MaterialButton(
                              onPressed: _onPressedFunction,
                              textColor: Colors.blue.shade700,
                              textTheme: ButtonTextTheme.primary,
                              minWidth: 100,
                              padding: const EdgeInsets.all(18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: BorderSide(
                                    color: Colors.blue.shade700),
                              ),
                              child: Text(
                                type == Status.login ? 'Log in' : 'Sign up',
                                style: const TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 32.0),
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            width: double.infinity,
                            child: _isLoading2
                                ? const Center(
                                child: CircularProgressIndicator())
                                : MaterialButton(
                              onPressed: _loginWithGoogle,
                              textColor: Colors.blue.shade700,
                              textTheme: ButtonTextTheme.primary,
                              minWidth: 100,
                              padding: const EdgeInsets.all(18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: BorderSide(color: Colors.blue.shade700),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: const [
                                  //  A google icon here
                                  //  an External Package used here
                                  //  Font_awesome_flutter package used
                                  FaIcon(FontAwesomeIcons.google),
                                  Text(
                                    ' Login with Google',
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: RichText(
                              text: TextSpan(
                                text: type == Status.login
                                    ? 'Don\'t have an account ?'
                                    : 'Already have an account ?',
                                style: const TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: type == Status.login
                                          ? ' Sign up now'
                                          : ' Log in',
                                      style: TextStyle(color: Colors.blue.shade700),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          _switchType();
                                        }
                                  ),
                                  TextSpan(
                                      text: 'Forgot password ?',
                                      style: TextStyle(color: Colors.blue.shade700),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // auth.sendPasswordResetEmail(email, context);
                                        }
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}