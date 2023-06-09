import 'package:tgw/export.dart';
import 'package:http/http.dart' as http;

class CurrencyProvider extends ChangeNotifier {

  bool isloading = false;
  String? error = "";
  String? result = "";
  List<dynamic> currencies = [];

  CurrencyData? _currencyData;
  CurrencyData? get currencyData => _currencyData;

  Future init()async{
    fetchCurrencyData();

  }

  Future<void> fetchCurrencyData() async {
    print("called");
    final response = await http.get(Uri.parse('https://api.exchangerate.host/latest?base=NGN'));

    print(response.body);



    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _currencyData = CurrencyData.fromJson(data);
      notifyListeners();
    }
  }


  Future<String?> convert({
    required String from,
    required String to,
    required String amount,
  }) async {
    isloading = true;
    String url =
        "https://api.exchangerate.host/convert?from=$from&to=$to&amount=$amount";
    final response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    final responseBody = await jsonDecode(response.body);

    result = responseBody["result"].toString();

    if(result == null){
      isloading = false;
      error = "Something went wrong";
      return "";
    }else{
      isloading = false;
      return result.toString();
    }

  }
}
