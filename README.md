# 🚚 LevaAí

> Plataforma digital para intermediação e pareamento logístico inteligente entre prestadores de serviço de frete e clientes finais.

O **LevaAí** é uma aplicação desenvolvida como Trabalho de Conclusão de Curso (TCC) voltada para a modernização do setor de carretos e mudanças. O sistema funciona como um catálogo interativo e inteligente, conectando usuários que precisam transportar itens a fretadores autônomos com veículos adequados à demanda específica (capacidade de carga, cubagem e porte).

---

## 📱 Protótipo da Interface

O design e fluxo de telas da aplicação foram construídos no Figma:
* [Acessar protótipo no Figma](https://www.figma.com/design/dlXG86eOCCoe8pWrFQw1gq/TCC?node-id=0-1&p=f)

**Módulos mapeados no protótipo:**
* Onboarding e Apresentação
* Autenticação e Perfis (Cliente / Fretador)
* Catálogo / Painel de Serviços com Filtros Avançados
* Histórico de Transportes e Pedidos
* Gestão de Endereços

---

## 🏛️ Arquitetura do Frontend

O projeto mobile foi construído em **Flutter**, adotando os padrões de **Clean Architecture** em conjunto com **MVVM (Model-View-ViewModel)** para garantir desacoplamento, testabilidade e manutenibilidade:

```text
lib/
├── core/                  # Recursos globais, erros, tema e injeção de dependências
│   ├── constants/
│   ├── di/
│   ├── errors/
│   ├── network/
│   └── theme/
├── data/                  # Implementações concretas de acesso a dados
│   ├── datasources/       # Chamadas a APIs externas e fontes locais
│   ├── models/            # DTOs e serialização JSON
│   └── repositories/      # Implementação dos contratos de repositório
├── domain/                # Regras de negócio puras (sem dependência de UI)
│   ├── entities/          # Modelos de domínio puros
│   ├── repositories/      # Contratos e interfaces abstratas
│   └── usecases/          # Casos de uso do sistema
└──
