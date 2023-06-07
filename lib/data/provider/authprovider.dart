import 'package:tgw/data/service/authservices.dart';
import 'package:tgw/export.dart';

class AuthProvider extends ChangeNotifier{
  final authService = AuthServices();
  ProviderResponse _response = const ProviderResponse();
  ProviderResponse get response => _response;


  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googleLogin({required Function(ProviderResponse) callback}) async {

    _response = const ProviderResponse(isLoading: true);
    notifyListeners();

    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    try{
      final user = await AuthServices().Signin(credential);
      _response = ProviderResponse(data: user);
      notifyListeners();
      callback(_response);
    }catch  (e){
      _response = ProviderResponse(error: e.toString());
      callback(_response);
      notifyListeners();
    }
  }

  Future logout({required Function callback}) async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signOut();
    await AuthServices().logout();
    notifyListeners();
    callback();
  }

}
