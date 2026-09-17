import '../entities/usuario_entity.dart';
import '../repositories/auth_repository_interface.dart';

class AutenticarUsuarioUseCase {
  final IAuthRepository _repository;

  const AutenticarUsuarioUseCase(this._repository);

  Future<UsuarioEntity> executar({
    required String email,
    required String senha,
  }) async {
    if (email.trim().isEmpty || !email.contains('@')) {
      throw Exception('Informe um e-mail válido');
    }
    if (senha.trim().isEmpty) {
      throw Exception('Informe sua senha');
    }
    return await _repository.autenticar(email: email, senha: senha);
  }
}