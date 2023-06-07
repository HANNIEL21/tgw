import 'package:tgw/export.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? ErrorMessage;
  bool loading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<AuthProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                const Spacer(
                  flex: 2,
                ),
                Container(
                  child: Image.asset("assets/twg-logo.png"),
                ),
                const Spacer(
                  flex: 1,
                ),
                Center(
                  child: loading ? const Center(child: CircularProgressIndicator(),) : ElevatedButton.icon(
                    onPressed: () => provider.googleLogin(callback: (result) {
                      final response = result;
                      if (response.error != null) {
                        setState(() {
                          ErrorMessage = response.error.toString();
                          context.showSnackbar(ErrorMessage!);
                        });

                        return;
                      }

                      setState(() {
                        loading = response.isLoading;
                      });

                      if(response.data != null){
                        context.showSnackbar("User Logged In");
                      }
                    }),
                    icon: const FaIcon(FontAwesomeIcons.google),
                    label: const Text("Sign in With Google"),
                  ),
                ),
                const Spacer(
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
