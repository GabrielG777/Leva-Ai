import '../../../domain/auth/entities/usuario_entity.dart';
import '../../../domain/auth/repositories/auth_repository_interface.dart';
import '../models/usuario_model.dart';

class AuthRepositoryMock implements IAuthRepository {
  @override
  Future<UsuarioEntity> autenticar({required String email, required String senha}) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return UsuarioModel(id: '1', nome: 'Usuário Teste', email: email);
  }

  @override
  Future<UsuarioEntity> cadastrar({
    required String nome,
    required String email,
    required String telefone,
    required String senha,
  }) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return UsuarioModel(id: '2', nome: nome, email: email, telefone: telefone);
  }
}