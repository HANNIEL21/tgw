import 'package:tgw/export.dart';

class ExchangeScreen extends StatelessWidget {
  const ExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currencyProvider = Provider.of<CurrencyProvider>(context);

    return Scaffold(
      body: currencyProvider.currencyData != null
          ? ListView.builder(
        itemCount: currencyProvider.currencyData!.rates.length,
        itemBuilder: (context, index) {
          final currency = currencyProvider.currencyData!.rates.keys.elementAt(index);
          final rate = currencyProvider.currencyData!.rates[currency];

          return CurrencyTile(name: currency, code: rate,);
        },
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
