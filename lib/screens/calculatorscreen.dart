import 'package:tgw/export.dart';
import 'package:math_expressions/math_expressions.dart';


class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  List<String> numberPad = [
    "c", "DEL", "%", "/",
    "7", "8", "9", "x",
    "4", "5", "6", "-",
    "1", "2", "3", "+",
    "AC","0", ".", "=",
  ];
  String question = "";
  String answerValue = "";



  void equal(){
    String Q = question;
    Q = Q.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(Q);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    answerValue = eval.toString();
  }


  void buttonTapped(String button) {
    setState(() {
      if (button == "c") {
        question = "";
      } else if (button == "DEL") {
        question = question.substring(0, question.length - 1);
      }else if(button == "AC"){
        question = "";
        answerValue = "";
      } else if (button == "="){
        equal();
      }else {
        question += button;
      }


    });
  }

  bool isOperator(String x){
    if(x == "+" || x == "-" || x == "x" || x == "/" || x == "%" || x == "="){
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5, bottom: 2),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(C.Cc.primary),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            question,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            answerValue,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                  if(index == 0){
                    return Button(
                      child: numberPad[index],
                      color: Colors.red,
                      onTap: () => buttonTapped(numberPad[index]),
                    );
                  }else if(index == 1){
                    return Button(
                      child: numberPad[index],
                      color: Colors.green,
                      onTap: () => buttonTapped(numberPad[index]),
                    );
                  }else{
                    return Button(
                      child: numberPad[index],
                      color: isOperator(numberPad[index]) ? Color(C.Cc.primary): Color(C.Cc.secondary),
                      onTap: () => buttonTapped(numberPad[index]),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
