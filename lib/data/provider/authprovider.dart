import 'package:tgw/data/service/authservices.dart';
import 'package:tgw/export.dart';

class AuthProvider extends ChangeNotifier{
  final authService = AuthServices();

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googleLogin({required Function() callback}) async {
    final googleUser = await GoogleSignIn().signIn();

    if(googleUser == null){
      throw Exception("No User Found");
      return;
    }

    _user = googleUser;

    final googleAuth =await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await AuthServices().Signin(credential);
    notifyListeners();
  }

  Future logout({required Function callback}) async {
    await AuthServices().logout();
    notifyListeners();
    callback();
  }

}
