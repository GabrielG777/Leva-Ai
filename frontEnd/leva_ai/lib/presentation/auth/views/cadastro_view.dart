import 'package:flutter/material.dart';

import '../../../core/routes/rotas_app.dart';
import '../../../core/theme/cores_app.dart';
import '../../../core/theme/tema_app.dart';
import '../viewmodels/cadastro_viewmodel.dart';
import '../widgets/campo_texto_app.dart';

class CadastroView extends StatefulWidget {
  final CadastroViewModel viewModel;

  const CadastroView({super.key, required this.viewModel});

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _telefoneController.dispose();
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        if (widget.viewModel.cadastrado) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, RotasApp.catalogo);
          });
        }

        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Botão Voltar Circular
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: CoresApp.claroBorda),
                      ),
                      child: const Icon(Icons.chevron_left_rounded, size: 24),
                    ),
                  ),
                  const SizedBox(height: 24),

                  Text(
                    'Crie sua conta',
                    style: context.text.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Preencha os dados abaixo para começar',
                    style: context.text.bodyMedium,
                  ),
                  const SizedBox(height: 24),

                  if (widget.viewModel.erro != null) ...[
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: CoresApp.erro.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        widget.viewModel.erro!,
                        style: const TextStyle(
                          color: CoresApp.erro,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],

                  CampoTextoApp(
                    label: 'Nome completo',
                    hint: 'Ex: Carlos Silva',
                    controller: _nomeController,
                  ),
                  const SizedBox(height: 16),
                  CampoTextoApp(
                    label: 'E-mail',
                    hint: 'carlos@exemplo.com',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  CampoTextoApp(
                    label: 'Telefone / WhatsApp',
                    hint: '(11) 98765-4321',
                    controller: _telefoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  CampoTextoApp(
                    label: 'Senha',
                    hint: '••••••••',
                    controller: _senhaController,
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  CampoTextoApp(
                    label: 'Confirmar senha',
                    hint: '••••••••',
                    controller: _confirmarSenhaController,
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),

                  // Checkbox Termos de Uso
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: widget.viewModel.aceitouTermos,
                          onChanged: widget.viewModel.alternarTermos,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: 'Aceito os ',
                            style: context.text.bodySmall,
                            children: const [
                              TextSpan(
                                text: 'Termos de Uso',
                                style: TextStyle(
                                  color: CoresApp.azulPrimario,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(text: ' e '),
                              TextSpan(
                                text: 'Política',
                                style: TextStyle(
                                  color: CoresApp.azulPrimario,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(text: '.'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),

                  ElevatedButton(
                    onPressed: widget.viewModel.carregando
                        ? null
                        : () => widget.viewModel.cadastrar(
                            nome: _nomeController.text,
                            email: _emailController.text,
                            telefone: _telefoneController.text,
                            senha: _senhaController.text,
                            confirmarSenha: _confirmarSenhaController.text,
                          ),
                    child: widget.viewModel.carregando
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text('Criar conta'),
                  ),
                  const SizedBox(height: 20),

                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text.rich(
                        TextSpan(
                          text: 'Já possui uma conta? ',
                          style: context.text.bodySmall,
                          children: const [
                            TextSpan(
                              text: 'Entrar',
                              style: TextStyle(
                                color: CoresApp.azulPrimario,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
