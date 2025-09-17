
# 📱 CodexPlus

Aplicativo iOS desenvolvido em **SwiftUI**, que consome feeds de notícias (G1 e Agronegócios) e exibe em uma interface organizada, com navegação por abas.

---

## 🚀 Funcionalidades

- **Feed de Notícias (G1 e Agronegócios)**
  - Carregamento inicial com `ProgressView`
  - Atualização via **Pull-to-Refresh**
  - Exibição de título, imagem, resumo e metadados

- **Menu Dinâmico**
  - Carregado via arquivo `.json` local
  - Cada item abre um link dentro do app usando `WebView`

- **Tratamento de Erros**
  - Exibição de mensagens amigáveis ao usuário
  - Opção de **Tentar novamente**

- **WebView Interna**
  - Notícias e links abrem dentro do próprio aplicativo
  - Baseada em `WKWebView`

- **Navegação por Abas (TabBar)**
  - Home (G1)
  - Agronegócios
  - Menu

---

## 🗂 Estrutura do Projeto

Organização das pastas principais:



---

## 🛠 Tecnologias Utilizadas

- **Swift 5.9**
- **SwiftUI**
- **Combine**
- **Xcode 15.4**
- **JSONDecoder** para consumo dos feeds

---

## 📖 Próximos Passos

- Criar paginação automática (scroll infinito)
- Implementar busca no feed
- Criar testes unitários (XCTest)

---

## 👩‍💻 Autora

Desenvolvido por **Ana Beatriz Félix** 🚀

---

