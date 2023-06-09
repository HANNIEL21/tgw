import 'package:tgw/export.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child){
      return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(C.Cc.primary),
                      borderRadius: BorderRadius.circular(80),

                    ),
                    child: Icon(Icons.person, size: 60, color: Color(C.Cc.background),),
                  ),

                  SizedBox(height: 40,),


                  Row(
                    children: [
                      Text("Email : ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),),
                      Text(provider.userEmail!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(C.Cc.secondary)),),
                    ],
                  ),
                  Row(
                    children: [
                      Text("id : ",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),),
                      Text(provider.userId!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(C.Cc.secondary)),),
                    ],
                  ),



                  SizedBox(height: 40,),


                  ElevatedButton.icon(onPressed: (){provider.logout(callback: (){
                    context.showSnackbar("user Logged out");
                  },);}, icon: Icon(Icons.logout), label: Text("Logout"),)

                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
