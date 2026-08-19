import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../favorite/presentation/provider/base/provider.dart';
import '../../data/repository/AuthRepository.dart';
import '../../data/repository/impl/AuthRepositoryImpl.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.read(dioProvider);
  return AuthRepositoryImpl(dio);
});