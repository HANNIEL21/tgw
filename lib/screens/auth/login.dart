import 'package:tgw/export.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  callback(){
    context.showSnackbar("User logged in");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<AuthProvider>(
          builder: (context, provider, child){
            return Column(
              children: [
                Spacer(
                  flex: 2,
                ),
                Container(
                  child: Image.asset("assets/twg-logo.png"),
                ),
                Spacer(
                  flex: 1,
                ),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: ()=> provider.googleLogin(callback: callback),
                    icon: FaIcon(FontAwesomeIcons.google),
                    label: Text("Sign in With Google"),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
