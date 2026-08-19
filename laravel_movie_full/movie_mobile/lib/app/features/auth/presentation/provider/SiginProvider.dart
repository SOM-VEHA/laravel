import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/SiginController.dart';
import '../state/SiginState.dart';
final loginProvider = NotifierProvider<LoginController, LoginState>(LoginController.new);
