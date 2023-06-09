import 'package:tgw/export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List<String> currency = [
    'USD',
    'ADA',
    'AGA',
    'ADA',
    'AEA',
    'ADE',
    'ADE',
    'NGN',
    'BBD',
    'BNB',
    'BGB',
    'BMB',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Card Balance",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "12,000,000",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add))
                ],
              ),


              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: currency.length,
                  itemBuilder: (context, index) {
                    return CurrencyTile2(name: currency[index],);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
