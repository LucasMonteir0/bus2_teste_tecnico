## Desafio Técnico - Bus2

O app foi desenvolvido com **Flutter v3.35.6**, seguindo os princípios de Repository Pattern e Orientação a Objetos.
Desde já agradeço a oportunidade de participar do processo seletivo da Bus2!

#### 📦 Principais Pacotes:

- **Flutter Modular**: Gerenciamento de rotas e injeção de dependências.
- **Bloc**: Gerenciamento de estado.
- **SQFlite**: Cache local.
- **Dio**: Rest Client.

#### 📱Dispositivos Suportados (Devido à limitações do SQFlite):

- **Android**
- **IOS**
- **MACOS**

#### 🧱 Arquitetura do Projeto:

```
lib/
|___ app.dart                  # Ponto central da aplicação Flutter, onde são feitas configurações de inicialização.
|___ app_module.dart           # Módulo central da aplicação, onde são instaciadas as rotas e as injeções de dependências.
|___ main.dart                 # Ponto de entrada da aplicação, onde a função main() fica.
|___ core/                     # Diretório que contém arquivos utilitários, configurações e classes genéricas que são reutilizadas em todo o app.
|   |___ clients/              # Contém que implementam diversos serviços na aplicação.
|   |___ erros/                # Contém classes para lidar com os diferentes tipos de erros que a aplicação pode encontrar.
|   |___ extensions/           # Contém extensões para adicionar funcionalidades a tipos já existentes.
|   |___ hepers/               # Contém classes auxiliares que ajudam a aplicação de diversas formas.
|   |___ wrappers/             # Contém classes de encapsulamento de dados.
|___ data/                     # Contém as abstrações e implementações de armazenamento de dados e redes da aplicação.
|   |___ models/               # Modelos de dados que são usados para transportar dados dentro da aplicação.
|   |___ repositories/         # Classes responsáveis pela lógica de busca e armazenamento de dados.  
|___ ui/                       # Diretório que contém toda a parte de UI do app.
       |___ components/        # Contém os widgets menores que são caracterizados como componentes.
       |___ view_models/       # Contém as classes responsaveis pelo gerenciamento de estado da UI.
       |___ views/             # Contém os widgets de página que representam as diferentes telas da aplicação.
```

#### ▶️ Rodando o projeto:

1. Execute o projeto com o Flutter:
    - Se houver mais de um dispositivo conectado:
      ```bash
      flutter run -d <deviceID>
      ```
    - Caso contrário:
      ```bash
      flutter run
      ```

---

