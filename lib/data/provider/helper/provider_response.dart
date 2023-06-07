import 'package:tgw/export.dart';

class ProviderResponse{
  final bool isLoading;
  final String? error;
  final BaseHelper? data;

  const ProviderResponse({this.data, this.error, this.isLoading = false});
}