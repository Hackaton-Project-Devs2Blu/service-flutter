# Arquitetura de Containerização (Flutter Web)

Este documento detalha a estratégia de build para disponibilizar a aplicação Flutter na web.

## Decisões Técnicas

### 1. Foco em Web (Single Page Application)
Optamos por compilar o Flutter para a plataforma **Web** (`flutter build web`).
* **Motivo:** Facilita a demonstração do projeto e o acesso via navegador durante o hackathon, eliminando a necessidade de gerar e instalar APKs em emuladores ou dispositivos físicos para testes rápidos na nuvem.

### 2. Multi-Stage Build
Utilizamos dois estágios para garantir eficiência:
* **Builder:** Utilizamos a imagem `ghcr.io/cirruslabs/flutter:stable`, que já contém o SDK do Flutter pré-instalado, economizando tempo significativo de download e instalação no pipeline de CI.
* **Runtime:** Utilizamos o **Nginx** rodando sobre **Alpine Linux**. O resultado é um container extremamente leve que serve apenas os arquivos estáticos (HTML, JS, CSS), sem a necessidade do Dart SDK em produção.

### 3. Configuração do Nginx (SPA)
Implementamos um arquivo `nginx.conf` personalizado.
* **O Problema:** Aplicações de Página Única (SPA) gerenciam rotas no lado do cliente. Se o usuário acessar uma rota direta (ex: `/detalhes`) e recarregar a página, o servidor web padrão retornaria erro 404.
* **A Solução:** A configuração `try_files $uri $uri/ /index.html;` redireciona todas as requisições desconhecidas para o `index.html`, permitindo que o framework do Flutter gerencie a navegação corretamente.

### 4. Cache de Dependências
Copiamos o arquivo `pubspec.yaml` antes do restante do código.
* **Motivo:** Permite que o Docker faça cache das dependências baixadas (`flutter pub get`). Se o arquivo de dependências não for alterado, esta etapa é pulada nas próximas builds, acelerando o processo.