# APP Cafeteira

Projeto Flutter que simula um atendimento de cafeteria.

## Visão Geral

Este projeto apresenta uma aplicação Flutter com uma lista de opções de pedidos personalizaveis utilizando:

    - MVVC (Padrão de Projeto)
    - MockAPI
    - get: ^4.6.6 (Gerenciamento de Estado)
    - http: ^1.2.0 (Comunicação com a API)
    - flutter_svg: ^2.0.9 (Manipulação de SVGs)

## Configurando o Arquivo .env

Este aplicativo depende de uma API para funcionar corretamente. Para configurar a API, siga estas etapas:

Na sua API crie 2 tabelas

items (tabela 1)    
``` 
    [
        {
            "name": "Cappuccino",
            "basePrice": 6.33,
            "id": "1",
            "syscoffeId": "1"
        },
        {
            "name": "Expresso",
            "basePrice": 7.33,
            "id": "2",
            "syscoffeId": "1"
        },
        {
            "name": "Latte",
            "basePrice": 8.33,
            "id": "3",
            "syscoffeId": "1"
        },
        {
            "name": "Macchiato",
            "basePrice": 9.33,
            "id": "4",
            "syscoffeId": "1"
        },
        {
            "name": "Mocha",
            "basePrice": 10.33,
            "id": "5",
            "syscoffeId": "1"
        }
    ]
```

cart (tabela 2 - Não precisa está preenchida mas necessita está preparada para receber o seguinte modelo)

```
{
    "name": "Cappuccino",
    "amount": 1,
    "size": "M",
    "price": 8.06,
    "sugar": "1",
    "idItem": "1",
    "syscoffeId": "1"
  }
```

    
    

## Video de demostração

https://www.linkedin.com/in/joaoygo/

## Recursos

- Tela de Inicio
- Tela de seleção de detalhes do item
- Tela de carrinho de compra

## Configuração do Ambiente de Desenvolvimento

Certifique-se de ter o Flutter (recomendado: 3.16.0) e o Dart (recomendado: 3.2.0) SDK instalados. Para configurar o ambiente, execute:

```bash
flutter pub get
```

## Como Executar

```bash
flutter run --dart-define URL_BASE_API=https://sua.api.com/
```
