📱 App Lista de Compras

Aplicativo mobile desenvolvido em Flutter para gerenciamento de listas de compras, permitindo adicionar produtos, marcar itens como concluídos e acompanhar o progresso da lista de forma visual.

🚀 Funcionalidades

✅ Criar múltiplas listas de compras

➕ Adicionar produtos com nome e valor

✔️ Marcar e desmarcar itens

📊 Barra de progresso automática baseada nos itens marcados

💰 Cálculo dinâmico de valores:

Total de itens marcados

Total de itens não marcados

🔄 Atualização controlada da lista apenas ao clicar em Atualizar

🧠 Controle de estado temporário para evitar alterações não confirmadas

🛠 Tecnologias utilizadas

Flutter

Dart

Material Design

Gerenciamento de estado com setState

Navegação com Navigator

Estrutura baseada em Models (BuyListModel, ProductModel)

📂 Estrutura do Projeto
lib/
 ├── data/
 │    └── app_data.dart
 ├── model/
 │    ├── buyList.model.dart
 │    └── product.model.dart
 ├── pages/
 │    ├── home_buy_list.dart
 │    ├── detail_buyList.page.dart
 │    ├── add_ListBuy.page.dart
 │    └── add_product.dart


🧠 Conceitos aplicados

Este projeto aplica conceitos importantes de desenvolvimento mobile:

Separação entre estado persistido e estado temporário

Controle manual de atualização de dados

Navegação entre telas com retorno de resultado

Manipulação de listas dinâmicas

Cálculo de dados derivados (progresso e totais)

Validação de formulários
