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

📸 Screenshots


<img width="200" height="350" alt="pagina-1" src="https://github.com/user-attachments/assets/b11b37e4-1ca5-4c61-9db4-f6ffb2c46e0c" style="margin-right:40px;" />
<img width="200" height="350" alt="pagina-3" src="https://github.com/user-attachments/assets/f2b00903-59a9-4fdb-adf4-d3379b2c46ca" style="margin-right:40px;" />
<img width="200" height="350" alt="pagina-8" src="https://github.com/user-attachments/assets/e7eebad3-7239-4eea-bf29-f4df555148f8" style="margin-right:40px;" />
<img width="200" height="350" alt="pagina-6" src="https://github.com/user-attachments/assets/a8d0e5f6-5389-4765-8d26-fc81b1ed7938" style="margin-right:40px;" />
