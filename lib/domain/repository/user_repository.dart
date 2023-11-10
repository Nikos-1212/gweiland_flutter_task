import 'dart:convert';
import 'package:gweiland_flutter_task/domain/entity/user_model.dart';
import 'package:gweiland_flutter_task/domain/repository/api_services.dart';
import 'package:gweiland_flutter_task/domain/repository/apis_config.dart';
import 'package:http/http.dart' as http;

class MyApiService implements ApiService {
  @override
  Future<CryptoCurrencyListingModel> getCryptoListing(
      int start, int limit, String convertInto) async {
    try {
      final response = await http.get(
          Uri.parse(
              '${ApiURL.cryptocurrencyListing}?start=$start&limit=$limit&convert=$convertInto'),
          headers: {
            'X-CMC_PRO_API_KEY': ApiURL.apiKey,
            'Accept': 'application/json'
          });
      final data = json.decode(response.body);

      if (response.statusCode == 200 && data != null) {
        final res = CryptoCurrencyListingModel.fromJson(data);
        if (res.status?.errorCode == 0) {
          return res;
        } else {
          throw Exception(
              'Request was not successful.'); // Throw an exception for unsuccessful response
        }
      } else {
        throw Exception(
            'Failed to fetch data'); // Throw an exception for non-200 status codes
      }
    } catch (exception) {
      throw Exception(
          'Failed to fetch data'); // Throw an exception for any exceptions
    }
  }

  // @override
  // Future<Response> post(String endpoint, {Map<String, dynamic> data}) {
  //   // Implement the HTTP POST request logic.
  // }

  // Implement the constructor and any additional methods.
}
