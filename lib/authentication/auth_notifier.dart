import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthNotifier extends ChangeNotifier {
  FirebaseAuth? _firebaseAuth;
  User? _user;
  Status _status = Status.Uninitialized;

  //getter

  Status get status => _status;

  User get user => _user!;

}