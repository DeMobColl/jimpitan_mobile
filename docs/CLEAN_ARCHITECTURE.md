# Clean Architecture Implementation

## Overview

This project now follows **Clean Architecture** principles with proper separation of concerns and loose coupling between layers. The architecture consists of three main layers:

1. **Domain Layer** - Business logic and entities (independent)
2. **Data Layer** - Data sources and repositories implementation
3. **Presentation Layer** - UI and state management

## Architecture Layers

### 1. Domain Layer (`lib/domain/`)

The **innermost layer** containing business logic and entities. It has **NO dependencies** on external layers.

#### Structure

```
domain/
├── entities/          # Pure Dart classes (business objects)
│   ├── auth/
│   │   ├── auth_request.dart
│   │   ├── auth_user.dart
│   │   └── auth_response.dart
│   └── input/
│       ├── input_nominal_request.dart
│       └── input_nominal_response.dart
├── repositories/      # Abstract repository interfaces
│   ├── auth_repository.dart
│   └── input_repository.dart
└── usecases/          # Business logic (use cases)
    ├── login_usecase.dart
    └── submit_input_nominal_usecase.dart
```

#### Key Points

- **Entities**: Plain Dart classes with no external dependencies
- **Repositories**: Abstract interfaces defining contracts
- **Use Cases**: Single-responsibility business operations

#### Example Entity

```dart
// Domain Entity (Clean - No dependencies)
class AuthUser {
  final String id;
  final String name;
  final String role;
  final String username;
  final String token;
  final String tokenExpiry;
  final String lastLogin;

  const AuthUser({
    required this.id,
    required this.name,
    required this.role,
    required this.username,
    required this.token,
    required this.tokenExpiry,
    required this.lastLogin,
  });
}
```

### 2. Data Layer (`lib/data/`)

The **middle layer** responsible for data handling and API communication.

#### Structure

```
data/
├── models/            # Data Transfer Objects (DTOs) with JSON serialization
│   ├── auth/
│   │   ├── auth_model.dart
│   │   ├── auth_model.freezed.dart
│   │   └── auth_model.g.dart
│   └── input/
│       ├── input_nominal_model.dart
│       ├── input_nominal_model.freezed.dart
│       └── input_nominal_model.g.dart
├── mappers/           # Convert between Models and Entities
│   ├── auth/
│   │   ├── auth_request_mapper.dart
│   │   ├── auth_user_mapper.dart
│   │   └── auth_response_mapper.dart
│   └── input/
│       ├── input_nominal_request_mapper.dart
│       └── input_nominal_response_mapper.dart
├── remote/            # API data sources
│   ├── auth/
│   │   └── auth_remote_source.dart
│   └── input/
│       └── input_remote_source.dart
└── repositories/      # Repository implementations
    ├── auth_repository_impl.dart
    └── input_repository_impl.dart
```

#### Key Points

- **Models**: Data classes with JSON serialization (using Freezed)
- **Mappers**: Convert between data models and domain entities
- **Remote Sources**: Handle API calls and return Models
- **Repository Implementations**: Implement domain repository interfaces, use mappers

#### Example Mapper

```dart
class AuthUserMapper {
  // Convert Model (Data Layer) to Entity (Domain Layer)
  static AuthUser toEntity(AuthUserModel model) {
    return AuthUser(
      id: model.id,
      name: model.name,
      role: model.role,
      username: model.username,
      token: model.token,
      tokenExpiry: model.tokenExpiry,
      lastLogin: model.lastLogin,
    );
  }

  // Convert Entity (Domain Layer) to Model (Data Layer)
  static AuthUserModel toModel(AuthUser entity) {
    return AuthUserModel(
      id: entity.id,
      name: entity.name,
      role: entity.role,
      username: entity.username,
      token: entity.token,
      tokenExpiry: entity.tokenExpiry,
      lastLogin: entity.lastLogin,
    );
  }
}
```

#### Example Repository Implementation

```dart
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AuthResponse> login(AuthRequest request) async {
    // 1. Convert domain entity to data model
    final requestModel = AuthRequestMapper.toModel(request);

    // 2. Call remote data source
    final responseModel = await remoteDataSource.login(requestModel);

    // 3. Convert data model back to domain entity
    return AuthResponseMapper.toEntity(responseModel);
  }
}
```

### 3. Presentation Layer (`lib/presentation/`)

The **outermost layer** containing UI and state management.

#### Structure

```
presentation/
├── auth/
│   ├── provider/
│   │   ├── auth_notifier.dart
│   │   └── auth_notifier.g.dart
│   ├── widgets/
│   │   ├── login_button.dart
│   │   ├── login_header.dart
│   │   └── login_text_field.dart
│   └── login_page.dart
├── home/
│   └── ...
└── input/
    ├── input_controller.dart
    └── input_page.dart
```

#### Key Points

- **Notifiers/Controllers**: Manage UI state using Riverpod
- **Pages/Widgets**: UI components
- **Uses Domain Entities**: NO direct access to data layer models

#### Example Notifier

```dart
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<AuthUser?> build() => null;  // Uses Domain Entity

  Future<void> login({
    required String username,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    final useCase = ref.read(loginUseCaseProvider);

    try {
      // Create domain entity (NOT data model)
      final request = AuthRequest(username: username, password: password);

      // Call use case, get domain entity response
      final response = await useCase(request);

      if (response.isSuccess && response.data != null) {
        state = AsyncValue.data(response.data);  // Domain entity
      } else {
        throw Exception(response.message ?? 'Login failed');
      }
    } catch (e, stack) {
      state = AsyncValue.error(e.toString(), stack);
    }
  }
}
```

## Data Flow

### Request Flow (e.g., Login)

```
UI (Presentation)
  ↓
[AuthNotifier creates AuthRequest entity]
  ↓
Use Case (Domain)
  ↓
Repository Interface (Domain)
  ↓
Repository Implementation (Data)
  ↓
[Mapper converts AuthRequest entity → AuthRequestModel]
  ↓
Remote Data Source (Data)
  ↓
[HTTP call returns AuthResponseModel]
  ↓
[Mapper converts AuthResponseModel → AuthResponse entity]
  ↓
Use Case receives AuthResponse entity
  ↓
AuthNotifier receives AuthResponse entity
  ↓
UI updates with AuthUser entity
```

## Benefits of This Architecture

### 1. **Separation of Concerns**

- Each layer has a clear responsibility
- Domain logic is independent of frameworks

### 2. **Loose Coupling**

- Presentation layer doesn't know about data models
- Domain layer doesn't know about API details
- Easy to swap implementations

### 3. **Testability**

- Domain logic can be tested without UI or API
- Repository can be mocked easily
- Each layer can be tested independently

### 4. **Maintainability**

- Changes in one layer don't affect others
- Clear boundaries between components
- Easier to understand and modify

### 5. **Scalability**

- Easy to add new features
- Can add new data sources (local DB, cache) without changing domain
- Can change UI framework without touching business logic

## Key Principles

1. **Dependency Rule**: Dependencies point inward
   - Presentation → Domain ← Data
   - Domain has NO dependencies on outer layers

2. **Interface Segregation**: Use abstract interfaces in domain layer

3. **Single Responsibility**: Each class has one reason to change

4. **Dependency Inversion**: Depend on abstractions, not concrete implementations

## Adding New Features

### Steps to add a new feature

1. **Create Domain Entities** (`lib/domain/entities/`)

   ```dart
   class Product {
     final String id;
     final String name;
     final double price;
   }
   ```

2. **Create Data Models** (`lib/data/models/`)

   ```dart
   @freezed
   class ProductModel with _$ProductModel {
     const factory ProductModel({
       required String id,
       required String name,
       required double price,
     }) = _ProductModel;

     factory ProductModel.fromJson(Map<String, dynamic> json) =>
         _$ProductModelFromJson(json);
   }
   ```

3. **Create Mappers** (`lib/data/mappers/`)

   ```dart
   class ProductMapper {
     static Product toEntity(ProductModel model) { ... }
     static ProductModel toModel(Product entity) { ... }
   }
   ```

4. **Create Repository Interface** (`lib/domain/repositories/`)

   ```dart
   abstract class ProductRepository {
     Future<List<Product>> getProducts();
   }
   ```

5. **Implement Repository** (`lib/data/repositories/`)

   ```dart
   class ProductRepositoryImpl implements ProductRepository {
     @override
     Future<List<Product>> getProducts() async {
       final models = await remoteDataSource.getProducts();
       return models.map((m) => ProductMapper.toEntity(m)).toList();
     }
   }
   ```

6. **Create Use Case** (`lib/domain/usecases/`)

   ```dart
   class GetProductsUseCase {
     final ProductRepository repository;

     Future<List<Product>> call() {
       return repository.getProducts();
     }
   }
   ```

7. **Create Notifier/Controller** (`lib/presentation/`)

   ```dart
   @riverpod
   class ProductNotifier extends _$ProductNotifier {
     @override
     FutureOr<List<Product>> build() async {
       final useCase = ref.read(getProductsUseCaseProvider);
       return await useCase();
     }
   }
   ```

## Important Notes

- **Never import data models in presentation layer**
- **Never import presentation components in domain layer**
- **Always use mappers to convert between layers**
- **Keep domain entities simple and framework-agnostic**
- **Use dependency injection (Riverpod providers) for loose coupling**

## Folder Summary

```
lib/
├── domain/              # Business logic (pure Dart)
│   ├── entities/        # Domain objects
│   ├── repositories/    # Repository contracts
│   └── usecases/        # Business operations
│
├── data/                # Data handling
│   ├── models/          # DTOs with JSON
│   ├── mappers/         # Model ↔ Entity conversion
│   ├── remote/          # API calls
│   └── repositories/    # Repository implementations
│
└── presentation/        # UI & State
    ├── auth/
    ├── home/
    └── input/
```

## Code Generation Commands

When you modify models or notifiers:

```bash
# Watch mode (auto-regenerate on file changes)
flutter pub run build_runner watch --delete-conflicting-outputs

# One-time build
flutter pub run build_runner build --delete-conflicting-outputs
```

---

**Remember**: Clean Architecture is about maintaining boundaries. The domain layer is the heart of your application and should remain pure and independent!
