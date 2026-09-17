import '../entities/usuario_entity.dart';
import '../repositories/auth_repository_interface.dart';

class CadastrarUsuarioUseCase {
  final IAuthRepository _repository;

  const CadastrarUsuarioUseCase(this._repository);

  Future<UsuarioEntity> executar({
    required String nome,
    required String email,
    required String telefone,
    required String senha,
    required String confirmarSenha,
    required bool aceitouTermos,
  }) async {
    if (nome.trim().isEmpty) throw Exception('Informe seu nome completo');
    if (!email.contains('@')) throw Exception('Informe um e-mail válido');
    if (telefone.trim().length < 10) throw Exception('Informe um telefone válido');
    if (senha.length < 6) throw Exception('A senha deve ter no mínimo 6 caracteres');
    if (senha != confirmarSenha) throw Exception('As senhas não conferem');
    if (!aceitouTermos) throw Exception('Você precisa aceitar os Termos de Uso');

    return await _repository.cadastrar(
      nome: nome,
      email: email,
      telefone: telefone,
      senha: senha,
    );
  }
}