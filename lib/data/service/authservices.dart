import 'package:tgw/export.dart';

class AuthServices{



  Future Signin(AuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }

}