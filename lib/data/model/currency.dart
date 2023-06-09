class CurrencyData {
  Map<String, double> rates;

  CurrencyData({required this.rates});

  factory CurrencyData.fromJson(Map<String, dynamic> json) {
    return CurrencyData(rates: Map<String, double>.from(json['rates']));
  }
}