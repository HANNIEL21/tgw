import 'package:tgw/export.dart';
import 'package:tgw/screens/calculatorscreen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {

  var currentPage = DrawerSection.home;



  @override
  Widget build(BuildContext context) {

    var screen;
    if(currentPage == DrawerSection.home){screen = HomeScreen();}
    else if(currentPage == DrawerSection.exchange){screen = ExchangeScreen();}
    else if(currentPage == DrawerSection.converter){screen = ConverterScreen();}
    else if(currentPage == DrawerSection.calculator){screen = CalculatorScreen();}
    else if(currentPage == DrawerSection.chat){screen = ChatScreen();}
    else if(currentPage == DrawerSection.account){screen = AccountScreen();}

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        actions: [
          Container(
            width: 280,
            height: 40,
            decoration: BoxDecoration(
              color: Color(C.Cc.background),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(color: Color(C.Cc.secondary)),
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: GestureDetector(
              onTap:(){
                setState(() {
                  screen = AccountScreen();
                });
              },
              child: CircleAvatar(
                backgroundColor: Color(C.Cc.primary),
                child: Icon(
                  Icons.person,
                  size: 35,
                  color: Color(C.Cc.secondary),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(C.Cc.background),
                    ),
                    const Column(
                      children: [
                        Text("data"),
                        Text("data"),
                      ],
                    )
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
                Column(children: [
                  MenuItem(1, FontAwesomeIcons.house, "Home",
                      currentPage == DrawerSection.home ? true : false),
                  MenuItem(2, Icons.currency_exchange, "Exchange",
                      currentPage == DrawerSection.exchange ? true : false),
                  MenuItem(3, FontAwesomeIcons.arrowsLeftRight, "Converter",
                      currentPage == DrawerSection.converter ? true : false),
                  MenuItem(4, Icons.calculate, "Calculator",
                      currentPage == DrawerSection.calculator ? true : false),
                  MenuItem(5, Icons.chat_bubble, "Chat",
                      currentPage == DrawerSection.chat ? true : false),
                  MenuItem(6, Icons.person_2, "Account",
                      currentPage == DrawerSection.account ? true : false),
                ]),
                const Spacer(
                  flex: 1,
                ),
                Row(
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.settings),
                        label: const Text("Setting")),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.logout),
                        label: const Text("Logout")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: screen,
    );
  }

  Widget MenuItem(int id, IconData icon, String title, bool selected) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Material(
        elevation: selected ? 5 : 0,
        borderRadius:
            selected ? BorderRadius.circular(10) : BorderRadius.circular(0),
        color: selected ? Color(C.Cc.background) : Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            setState(() {
              if(id == 1){currentPage = DrawerSection.home;}
              else if(id == 2){currentPage = DrawerSection.exchange;}
              else if(id == 3){currentPage = DrawerSection.converter;}
              else if(id == 4){currentPage = DrawerSection.calculator;}
              else if(id == 5){currentPage = DrawerSection.chat;}
              else if(id == 6){currentPage = DrawerSection.account;}
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: FaIcon(
                    icon,
                    size: 30,
                    color:
                        selected ? Color(C.Cc.primary) : Color(C.Cc.background),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: selected ? 20 : 18,
                      color: selected
                          ? Color(C.Cc.primary)
                          : Color(C.Cc.background),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


enum DrawerSection  {
  home,
  exchange,
  converter,
  calculator,
  chat,
  account,
}