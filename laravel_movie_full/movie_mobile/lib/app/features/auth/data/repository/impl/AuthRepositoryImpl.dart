import 'package:dio/dio.dart';
import '../../../../../network/api_exception.dart';
import '../../model/AuthModel.dart';
import '../AuthRepository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio dio;

  AuthRepositoryImpl(this.dio);

  @override
  Future<Auth> login({required String email, required String password}) async {
    try {
      final response = await dio.post(
        'http://10.0.2.2:8000/api/login',
        data: {'email': email, 'password': password},
      );
      final json = response.data as Map<String, dynamic>;
      if (json['success'] == true) {

        return Auth.fromJson(json);
      }
      throw ApiException(
        message: json['message']?.toString() ?? 'Login failed',
      );
    } on DioException catch (e) {
      final errorData = e.response?.data;
      if (errorData is Map<String, dynamic>) {
        throw ApiException(
          message: errorData['message']?.toString() ?? 'Network error',
        );
      }
      throw ApiException(message: e.message ?? 'Network error');
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Auth> register({
    required String username,
    required String email,
    required String password,
  }) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
