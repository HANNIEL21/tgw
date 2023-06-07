import 'package:tgw/export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(C.Cc.background),
        appBarTheme: AppBarTheme(backgroundColor: Color(C.Cc.primary)),
        drawerTheme: DrawerThemeData(
          backgroundColor: Color(C.Cc.primary),
          elevation: 3,
        ),
        useMaterial3: true,
      ),
      home: const AuthPage(),
    );
  }
}
