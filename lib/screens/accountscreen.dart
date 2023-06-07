import 'package:tgw/export.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              IconButton(onPressed: ()=> Navigator.pop(context), icon: Icon(Icons.chevron_left))
            ],
          ),
        ),
      ),
    );
  }
}
