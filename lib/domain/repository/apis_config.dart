class ApiURL {
  final String hosturl;

  ApiURL._(this.hosturl);

  factory ApiURL.devENV() {
    return ApiURL._('https://sandbox-api.coinmarketcap.com/v1');
  }

  factory ApiURL.prodENV() {
    return ApiURL._('https://sandbox-api.coinmarketcap.com/v1');
  }

  // uat
  static const String baseURL = 'https://sandbox-api.coinmarketcap.com/v1';
  static const String cryptocurrencyListing =
      '$baseURL/cryptocurrency/listings/latest';
  static const String apiKey = 'b54bcf4d-1bca-4e8e-9a24-22ff2c3d462c';

  //prod
}

//Factory constructor
//   class ApiRepository {
//   final String baseUrl;
//   final String apiKey;

//   // Private constructor
//   ApiRepository._(this.baseUrl, this.apiKey);

//   // Factory constructor to create instances with custom configurations
//   factory ApiRepository.development() {
//     return ApiRepository._('https://api.dev.example.com', 'your_dev_api_key');
//   }

//   factory ApiRepository.staging() {
//     return ApiRepository._('https://api.staging.example.com', 'your_staging_api_key');
//   }

//   factory ApiRepository.production() {
//     return ApiRepository._('https://api.example.com', 'your_production_api_key');
//   }

//   // Add methods for making API requests using baseUrl and apiKey
//   Future<Response> fetchData(String endpoint) async {
//     final response = await http.get(Uri.parse('$baseUrl/$endpoint'), headers: {
//       'Authorization': 'Bearer $apiKey',
//     });
//     return Response.fromJson(response);
//   }
// }

// void fetch() {
//   // Create repository instances for different environments
//   final devRepository = ApiRepository.development();
//   final stagingRepository = ApiRepository.staging();
//   final productionRepository = ApiRepository.production();

//   // Use the repositories to make API calls
//   devRepository.fetchData('data_endpoint');
//   stagingRepository.fetchData('data_endpoint');
//   productionRepository.fetchData('data_endpoint');
// }
