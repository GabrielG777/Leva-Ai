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

## 🌿 Fluxo de Trabalho Git (Branches & Contribuição)

Adotamos o fluxo de desenvolvimento baseado em branches de funcionalidade (**Feature Branching**). A branch `develop` é a nossa base de integração contínua.

### 📌 Regras Gerais
* Ninguém desenvolve diretamente na `main` ou na `develop`.
* Cada nova tela, componente ou regra de negócio deve ter sua própria branch a partir da `develop`.
* Commits devem ser claros e descritivos.

---

### 🚀 Passo a Passo para Desenvolver uma Nova Feature

#### 1. Atualize a sua base local
Antes de criar uma branch, garanta que a sua `develop` local tem as últimas alterações do repositório remoto:
```bash
git switch develop
git pull origin develop
