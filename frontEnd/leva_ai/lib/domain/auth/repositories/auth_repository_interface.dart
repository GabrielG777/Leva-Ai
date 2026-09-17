import '../entities/usuario_entity.dart';

abstract interface class IAuthRepository {
  Future<UsuarioEntity> autenticar({
    required String email,
    required String senha,
  });

  Future<UsuarioEntity> cadastrar({
    required String nome,
    required String email,
    required String telefone,
    required String senha,
  });
}