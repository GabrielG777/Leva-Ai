import 'package:flutter/material.dart';
import '../../../core/routes/rotas_app.dart';
import '../../../core/theme/cores_app.dart';
import '../../../core/theme/tema_app.dart';
import '../viewmodels/login_viewmodel.dart';
import '../widgets/campo_texto_app.dart';

class LoginView extends StatefulWidget {
  final LoginViewModel viewModel;

  const LoginView({super.key, required this.viewModel});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        if (widget.viewModel.autenticado) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, RotasApp.catalogo);
          });
        }

        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  // Logo + Nome do App
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: CoresApp.azulPrimario,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.local_shipping_rounded, color: Colors.white, size: 24),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('LevaAí', style: context.text.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                          Text('Logística inteligente na sua mão', style: context.text.bodySmall),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),

                  // Títulos
                  Text('Que bom ter você de volta!', style: context.text.headlineMedium?.copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Text('Entre com suas credenciais para continuar', style: context.text.bodyMedium),
                  const SizedBox(height: 32),

                  // Mensagem de Erro
                  if (widget.viewModel.erro != null) ...[
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: CoresApp.erro.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(widget.viewModel.erro!, style: const TextStyle(color: CoresApp.erro, fontSize: 13)),
                    ),
                    const SizedBox(height: 16),
                  ],

                  // Formulário
                  CampoTextoApp(
                    label: 'E-mail',
                    hint: 'cliente@levaai.com',
                    controller: _emailController,
                    icone: Icons.mail_outline_rounded,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  CampoTextoApp(
                    label: 'Senha',
                    hint: '••••••',
                    controller: _senhaController,
                    icone: Icons.lock_outline_rounded,
                    obscureText: true,
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Esqueci minha senha', style: TextStyle(fontSize: 13, color: CoresApp.azulPrimario)),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Botão Entrar
                  ElevatedButton(
                    onPressed: widget.viewModel.carregando
                        ? null
                        : () => widget.viewModel.login(_emailController.text, _senhaController.text),
                    child: widget.viewModel.carregando
                        ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                        : const Text('Entrar'),
                  ),

                  const SizedBox(height: 80),

                  // Link Criar Conta
                  Center(
                    child: Column(
                      children: [
                        Text('Ainda não possui uma conta?', style: context.text.bodySmall),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, RotasApp.entrar),
                          child: const Text(
                            'Criar conta gratuitamente',
                            style: TextStyle(color: CoresApp.azulPrimario, fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                      ],
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