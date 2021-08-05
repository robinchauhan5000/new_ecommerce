import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/models/UserResults.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class SocialLogin {
  Future<UserResults> fbLogin({BuildContext context}) async {
    final facebookLogin = FacebookLogin();
    final facebookLoginResult = await facebookLogin.logIn(['email']);
    var profile, token;
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        print("Error apps " + facebookLoginResult.errorMessage);
        break;
      case FacebookLoginStatus.loggedIn:
        token = facebookLoginResult.accessToken.token;
        print("token" + token);
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.width(100).height(100)&access_token=$token');
        if (graphResponse.statusCode == 200) {
          profile = json.decode(graphResponse.body);
          print("profile" + profile.toString());
        } else {
          print("Error");
        }
        break;
    }
    var results = UserResults(token: token, profile: profile);
    return results;
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final AccessToken result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final facebookAuthCredential =
        FacebookAuthProvider.credential(result.token);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }

  Future<UserResults> googleLogin() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    var results;
    await _googleSignIn.signIn().then((GoogleSignInAccount acc) async {
      await acc.authentication.then((GoogleSignInAuthentication auth) async {
        results =
            UserResults(googleProfile: acc, googleToken: auth.accessToken);
        print("data" + auth.accessToken.toString());
      });
    });
    return results;
  }
}
