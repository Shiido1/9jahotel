import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/core_folder/manager/shared_preference.dart';
import '../screens/dashboard.dart';

final _session = SharedPreferencesService();

class GoogleAuthServices {
  signInWithGoogle(context) async {
    print("object");
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    FirebaseAuth.instance.signInWithCredential(credential).then((o) {
      // print(o.additionalUserInfo?.profile);
      // print('eeeeee${o.additionalUserInfo?.profile}');
      if (o.user?.emailVerified == true) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Dashboard()));
        _session.usersData = o.additionalUserInfo?.profile;
        _session.isLoggedIn = true;
      }
    });
    // print("_session.usersData ${_session.usersData}");
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
