import 'package:tgw/export.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({super.key});

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(C.Cc.background),
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Color(C.Cc.primary),

        title: Text("Exchange"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: 100,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
            return CurrencyTile();
          },

          ),
        ),
      ),
    );
  }
}
