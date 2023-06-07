import 'package:tgw/export.dart';
import 'package:tgw/widgets/padbutton.dart';

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
    "=",
    "0",
  ];

  String buttonValue = "";
  String answerValue = "";

  void buttonTapped(String button) {
    setState(() {
      if (button == "c") {
        buttonValue = "";
      } else if (button == "DEL") {
        buttonValue = buttonValue.substring(0, buttonValue.length - 1);
      } else {
        buttonValue += button;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                            margin: const EdgeInsets.only(bottom: 2),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color(C.Cc.primary),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5, bottom: 2),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: 80,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Color(C.Cc.primary),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Text("From : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                Container(
                                  child: Text(
                                    buttonValue,
                                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color(C.Cc.primary),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 2, left: 5),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: 80,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Color(C.Cc.primary),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Text("TO : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                Container(
                                  child: Text(
                                    answerValue,
                                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
                    left: 65,
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  return PadButton(
                    child: numberPad[index],
                    onTap: () => buttonTapped(numberPad[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
