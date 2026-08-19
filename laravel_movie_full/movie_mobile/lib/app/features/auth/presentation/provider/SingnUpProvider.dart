import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/SignUpConroller.dart';
import '../state/SiginState.dart';
final signupProvider = NotifierProvider<SignUpController, LoginState>(SignUpController.new);