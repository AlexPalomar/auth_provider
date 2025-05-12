// domain/usecases/login_usecase.dart


import 'package:first_app/features/auth/domain/entities/user.dart';

class LoginUseCase {


  Future<User?> call(String email, String password) {
    var repository;
    return repository.login(email, password);
  }
}
