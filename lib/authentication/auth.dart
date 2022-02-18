import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:s_demo/app_constants/sd_colors.dart';
import 'package:twitter_login/twitter_login.dart';



class AuthenticationHelper{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential? _userCredential;
  User? user;
  Timer? timer;
  static String? errorMessage;

  void toast(String msg){
    Fluttertoast.showToast(
      msg: msg,
      textColor: whiteColor,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: SDColorPrimary,
      gravity: ToastGravity.BOTTOM
    );
  }


  Future<void> signUp(String? email, String? password, BuildContext context) async {
    try{
     _userCredential = await _auth.createUserWithEmailAndPassword(email: email!, password: password!);
    } on FirebaseAuthException catch (e){
      errorMessage = e.message;
      toast(errorMessage!);
    }
  }

  Future<void> signIn(String? email, String? password, BuildContext context) async {
   try{
     _userCredential = await _auth.signInWithEmailAndPassword(email: email!, password: password!);
   }on FirebaseAuthException catch (error){
     switch (error.code) {
       case "invalid-email":
         errorMessage = "Your email address appears to be malformed.";

         break;
       case "wrong-password":
         errorMessage = "Your password is wrong.";
         break;
       case "user-not-found":
         errorMessage = "User with this email doesn't exist.";
         break;
       case "user-disabled":
         errorMessage = "User with this email has been disabled.";
         break;
       case "too-many-requests":
         errorMessage = "Too many requests";
         break;
       case "operation-not-allowed":
         errorMessage = "Signing in with Email and Password is not enabled.";
         break;
       default:
         errorMessage = "An undefined Error happened.";
     }
     toast(errorMessage!);
   }
   // check email verification
    try{
     if(_userCredential != null){
       user = _auth.currentUser;
       if(!user!.emailVerified){
         _auth.signOut();
         errorMessage = "Email not verified";
         toast(errorMessage!);
       }
     }
    }catch(e){
     toast(e.toString());
    }

  }

  Future signOut() async{
    await _auth.signOut();
  }


  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken
    );

    try{
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch(error){
      print(error.message);
    }
  }

  Future<void> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    try{
      await _auth.signInWithCredential(facebookAuthCredential);
    }on FirebaseAuthException catch(e){
      print(e.message);
    }
  }
  Future<void> signInWithTwitter() async {
    final twitterLogin = new TwitterLogin(
      apiKey: 'bWcfsQ0ORmvIJ25T9vsvM0XVr',
      apiSecretKey : 'e67J3brlMSbhSiD1UbeAqa4YXJ2dkyensa6GkRtCD9CcUZlPmG',
      redirectURI : 'schand_social_Auth://'
    );

    final authResult = await twitterLogin.login();

    final twitterAuthCredential = TwitterAuthProvider.credential(
        accessToken: authResult.authToken!,
        secret: authResult.authTokenSecret!,
    );
    try{
      await _auth.signInWithCredential(twitterAuthCredential);
    }on FirebaseAuthException catch(e){
      print(e.message);
    }
  }
}