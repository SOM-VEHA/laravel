import 'package:dio/dio.dart';
import '../../model/Auth.dart';
import '../AuthRepository.dart';

class AuthRepositoryImpl implements AuthRepository{

  final Dio dio;

  AuthRepositoryImpl(this.dio);

  @override
  Future<Auth> login({required String email, required String password}) async {
    try {
      final response = await dio.post('/login',data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Auth.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw AuthException(
          message: response.data['message'] ?? 'Failed to login',
        );
      }
    } on DioException catch (e) {
      // Handle Dio-specific errors (network timeout, 401 unauthorized, etc.)
      final errorMessage = e.response?.data?['message'] ??
          e.message ??
          'An unexpected network error occurred';
      throw AuthException(message: errorMessage);
    } catch (e) {
      // Handle unexpected parsing or logic errors
      throw AuthException(message: e.toString());
    }
  }
}

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Auth> register({required String username, required String email, required String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }
}