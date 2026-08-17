class ApiEndpoints {
  ApiEndpoints._();
  static const String baseUrl = 'http://10.0.2.2:8000/api';
  static const String login = '$baseUrl/login';
  static const String register = '$baseUrl/register';
  static const String logout = '$baseUrl/logout';
  static const String categories = '$baseUrl/categories';
  static const String movies = '$baseUrl/movies';
  static const String favorites = '$baseUrl/favorites';
  static const String slides = '$baseUrl/slides';
}