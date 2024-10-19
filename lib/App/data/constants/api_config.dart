enum Environment { development, production }

class ApiConfig {
  static const String apiServer = "https://jsonplaceholder.typicode.com/";

  static const String developmentBaseUrl = '$apiServer';
  static const String productionBaseUrl = '$apiServer';

  static Environment currentEnvironment = Environment.development;

  static String get baseUrl {
    switch (currentEnvironment) {
      case Environment.development:
        return developmentBaseUrl;
      case Environment.production:
        return productionBaseUrl;
    }
  }

/*X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X*/

// Authentication

  static String postsApi = "${baseUrl}posts/";

/*X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X*/
}
