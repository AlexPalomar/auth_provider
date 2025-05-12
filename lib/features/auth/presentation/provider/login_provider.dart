// presentation/providers/login_provider.dart
import 'package:first_app/features/auth/domain/entities/user.dart';
import 'package:first_app/features/auth/domain/usecases/LoginUseCase.dart';
import 'package:flutter/material.dart';


class LoginProvider with ChangeNotifier {
  final LoginUseCase loginUseCase;

  LoginProvider(this.loginUseCase);

  bool isLoading = false;
  User? user;
  String? error;

  Future<void> login(String email, String password) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      user = await loginUseCase(email, password);
      if (user == null) {
        error = "Credenciales inválidas";
      }
    } catch (e) {
      error = "Error del servidor";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}