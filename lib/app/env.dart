abstract class Env {
  static const apiUrl =
      String.fromEnvironment('API_URL', defaultValue: 'http://localhost:3000');
}
