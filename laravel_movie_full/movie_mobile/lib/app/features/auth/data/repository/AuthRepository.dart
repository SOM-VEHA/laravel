import '../model/AuthModel.dart';

abstract interface class AuthRepository{

  Future<Auth> login({required String email, required String password});

  Future<Auth> register({required String username, required String email, required String password});

  Future<void> logout();

}