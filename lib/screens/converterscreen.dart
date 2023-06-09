import 'package:tgw/export.dart';
import 'package:http/http.dart' as http;

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  List<String> numberPad = [
    "7",
    "8",
    "9",
    "c",
    "4",
    "5",
    "6",
    "DEL",
    "1",
    "2",
    "3",
    "0",
  ];
  List<dynamic> currencies = [];

  Future<String> currency() async {
    String url = "https://api.exchangerate.host/latest";

    final response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    final responseBody = jsonDecode(response.body);
    Map currencyMap = responseBody["rates"];
    currencies = currencyMap.keys.toList();
    setState(() {});
    print(currencies);
    return "success";
  }

  @override
  void initState() {
    // TODO: implement initState
    currency();
    super.initState();
  }

  String inputValue = "";
  String answerValue = "";
  String fromCurrencyValue = "";
  String toCurrencyValue = "";

  void buttonTapped(String button) {
    setState(() {
      if (button == "c") {
        inputValue = "";
      } else if (button == "DEL") {
        inputValue = inputValue.substring(0, inputValue.length - 1);
      } else {
        inputValue += button;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrencyProvider>(builder: (context, provider, child) {
      return Scaffold(
        body: currencies == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 2),
                                    height: 80,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Color(C.Cc.primary),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Dropdown(
                                      hint: Text(
                                        "select",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Color(C.Cc.secondary),
                                        ),
                                      ),
                                      icon: null,
                                      item: currencies
                                          .map((value) => DropdownMenuItem(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      color: Color(
                                                          C.Cc.secondary)),
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        print(value);
                                        setState(() {
                                          fromCurrencyValue = value;
                                        });
                                      },
                                      validator: null,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 5, bottom: 2),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    height: 80,
                                    width: 280,
                                    decoration: BoxDecoration(
                                      color: Color(C.Cc.primary),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "From : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Color(C.Cc.secondary)),
                                        ),
                                        Container(
                                          child: Text(
                                            inputValue,
                                            style: TextStyle(
                                                color: Color(C.Cc.secondary),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 2),
                                    height: 80,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Color(C.Cc.primary),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Dropdown(
                                      hint: Text(
                                        "select",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Color(C.Cc.secondary),
                                        ),
                                      ),
                                      icon: null,
                                      item: currencies
                                          .map((value) => DropdownMenuItem(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color:
                                                        Color(C.Cc.secondary),
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        print(value);
                                        setState(() {
                                          toCurrencyValue = value;
                                        });
                                      },
                                      validator: null,
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(top: 2, left: 5),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    height: 80,
                                    width: 280,
                                    decoration: BoxDecoration(
                                      color: Color(C.Cc.primary),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "TO : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Color(C.Cc.secondary)),
                                        ),
                                        Container(
                                          child: Text(
                                            answerValue,
                                            style: TextStyle(
                                                color: Color(C.Cc.secondary),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            left: 85,
                            top: 58,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.currency_exchange),
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  Color(C.Cc.background),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: numberPad.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4),
                        itemBuilder: (BuildContext context, int index) {
                          return PadButton(
                            child: numberPad[index],
                            onTap: () => buttonTapped(numberPad[index]),
                          );
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: (){
                          provider.convert(
                            from: fromCurrencyValue,
                            to: toCurrencyValue,
                            amount: inputValue,
                          );

                          setState(() {
                            answerValue = provider.result.toString();
                          });
                        },
                        child: Icon(Icons.currency_exchange),
                      ),
                    ],
                  ),
                ),
              ),
      );
    });
  }
}
