# Quick Reference: Clean Architecture in This Project

## Layer Responsibilities

| Layer | Purpose | Dependencies | Example |
|-------|---------|--------------|---------|
| **Presentation** | UI & State | → Domain only | `AuthNotifier`, `LoginPage` |
| **Domain** | Business Logic | → Nothing (Pure Dart) | `AuthUser`, `LoginUseCase` |
| **Data** | Data Sources | → Domain only | `AuthRepositoryImpl`, Mappers |

## Quick Decision Tree

### "Where should I put this code?"

```
Is it about UI or user interaction?
  YES → Presentation Layer (lib/presentation/)
  NO  ↓

Is it business logic or a business rule?
  YES → Domain Layer (lib/domain/)
  NO  ↓

Is it about data fetching or API?
  YES → Data Layer (lib/data/)
```

### "What type should I use?"

```
Am I in Presentation Layer?
  → Use Domain Entities (AuthUser, AuthRequest, etc.)

Am I in Domain Layer?
  → Use Domain Entities (only pure Dart classes)

Am I in Data Layer working with API/JSON?
  → Use Data Models (AuthUserModel, AuthRequestModel, etc.)

Am I converting between layers?
  → Use Mappers (AuthUserMapper, etc.)
```

## Common Patterns

### Pattern 1: Creating a Domain Entity

```dart
// lib/domain/entities/product/product.dart
class Product {
  final String id;
  final String name;
  final double price;

  const Product({
    required this.id,
    required this.name,
    required this.price,
  });
}
```

**Rules:**

- ✅ Plain Dart class
- ✅ No external packages (except Dart SDK)
- ✅ Immutable (final fields)
- ❌ No JSON annotations
- ❌ No Freezed

### Pattern 2: Creating a Data Model

```dart
// lib/data/models/product/product_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

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

**Rules:**

- ✅ Use Freezed for immutability
- ✅ Include JSON serialization
- ✅ Can have different fields than domain entity
- ❌ Don't use in presentation layer

### Pattern 3: Creating a Mapper

```dart
// lib/data/mappers/product/product_mapper.dart
import '../../../domain/entities/product/product.dart';
import '../../models/product/product_model.dart';

class ProductMapper {
  // Model → Entity (for reading from API)
  static Product toEntity(ProductModel model) {
    return Product(
      id: model.id,
      name: model.name,
      price: model.price,
    );
  }

  // Entity → Model (for sending to API)
  static ProductModel toModel(Product entity) {
    return ProductModel(
      id: entity.id,
      name: entity.name,
      price: entity.price,
    );
  }
}
```

**Rules:**

- ✅ Static methods
- ✅ bidirectional conversion
- ✅ Handle null cases if needed
- ✅ Can transform data (e.g., format dates)

### Pattern 4: Repository Interface (Domain)

```dart
// lib/domain/repositories/product_repository.dart
import '../entities/product/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProductById(String id);
  Future<void> createProduct(Product product);
}
```

**Rules:**

- ✅ Abstract class
- ✅ Use domain entities
- ✅ No implementation details
- ❌ No mentions of API, database, etc.

### Pattern 5: Repository Implementation (Data)

```dart
// lib/data/repositories/product_repository_impl.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/entities/product/product.dart';
import '../remote/product/product_remote_source.dart';
import '../mappers/product/product_mapper.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Product>> getProducts() async {
    // 1. Get data models from API
    final models = await remoteDataSource.getProducts();

    // 2. Convert to domain entities using mapper
    return models.map((model) => ProductMapper.toEntity(model)).toList();
  }

  @override
  Future<Product> getProductById(String id) async {
    final model = await remoteDataSource.getProductById(id);
    return ProductMapper.toEntity(model);
  }

  @override
  Future<void> createProduct(Product product) async {
    // Convert entity to model before sending to API
    final model = ProductMapper.toModel(product);
    await remoteDataSource.createProduct(model);
  }
}

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl(
    remoteDataSource: ref.watch(productRemoteDataSourceProvider),
  );
});
```

**Rules:**

- ✅ Implements domain interface
- ✅ Uses mappers for conversion
- ✅ Handles data source details
- ✅ Returns domain entities

### Pattern 6: Use Case

```dart
// lib/domain/usecases/get_products_usecase.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../entities/product/product.dart';
import '../repositories/product_repository.dart';
import '../../data/repositories/product_repository_impl.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase({required this.repository});

  Future<List<Product>> call() {
    return repository.getProducts();
  }
}

final getProductsUseCaseProvider = Provider<GetProductsUseCase>((ref) {
  return GetProductsUseCase(
    repository: ref.watch(productRepositoryProvider),
  );
});
```

**Rules:**

- ✅ Single responsibility
- ✅ Takes repository in constructor
- ✅ Use domain entities
- ✅ Contains business logic if needed

### Pattern 7: Presentation Notifier

```dart
// lib/presentation/product/provider/product_notifier.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/entities/product/product.dart';
import '../../../domain/usecases/get_products_usecase.dart';

part 'product_notifier.g.dart';

@riverpod
class ProductNotifier extends _$ProductNotifier {
  @override
  FutureOr<List<Product>> build() async {
    // Load initial data
    final useCase = ref.read(getProductsUseCaseProvider);
    return await useCase();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final useCase = ref.read(getProductsUseCaseProvider);
      final products = await useCase();
      state = AsyncValue.data(products);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
```

**Rules:**

- ✅ Use domain entities
- ✅ Call use cases
- ❌ No direct repository access
- ❌ No data models

## Import Rules

### ✅ ALLOWED Imports

**In Presentation:**

```dart
import '../../../domain/entities/...';           // ✅ Domain entities
import '../../../domain/usecases/...';           // ✅ Use cases
```

**In Domain:**

```dart
// No imports from presentation or data!
// Only other domain files or Dart SDK
```

**In Data:**

```dart
import '../../domain/entities/...';              // ✅ Domain entities
import '../../domain/repositories/...';          // ✅ Domain interfaces
import '../models/...';                          // ✅ Other data models
import '../mappers/...';                         // ✅ Mappers
```

### ❌ FORBIDDEN Imports

**In Presentation:**

```dart
import '../../data/models/...';                  // ❌ NO data models!
import '../../data/repositories/...';            // ❌ NO direct repo impl!
```

**In Domain:**

```dart
import '../../presentation/...';                 // ❌ NO presentation!
import '../../data/...';                         // ❌ NO data layer!
```

## Checklist for New Features

- [ ] 1. Create domain entity in `lib/domain/entities/`
- [ ] 2. Create data model with Freezed in `lib/data/models/`
- [ ] 3. Create mapper in `lib/data/mappers/`
- [ ] 4. Create repository interface in `lib/domain/repositories/`
- [ ] 5. Create remote data source in `lib/data/remote/`
- [ ] 6. Implement repository in `lib/data/repositories/`
- [ ] 7. Create use case in `lib/domain/usecases/`
- [ ] 8. Create notifier in `lib/presentation/.../provider/`
- [ ] 9. Create UI in `lib/presentation/`
- [ ] 10. Run code generation: `flutter pub run build_runner build --delete-conflicting-outputs`
- [ ] 11. Test each layer independently

## Common Mistakes to Avoid

| ❌ Don't Do This | ✅ Do This Instead |
|------------------|-------------------|
| Use `AuthUserModel` in notifier | Use `AuthUser` entity |
| Import data models in UI | Import domain entities |
| Put business logic in notifier | Put in use case |
| Skip mappers, use models everywhere | Always use mappers |
| Mix entity and model in same file | Keep separate |
| Add JSON to domain entities | Only in data models |

## File Naming Convention

| Type | Location | Naming |
|------|----------|--------|
| Entity | `domain/entities/feature/` | `entity_name.dart` |
| Model | `data/models/feature/` | `entity_name_model.dart` |
| Mapper | `data/mappers/feature/` | `entity_name_mapper.dart` |
| Repository Interface | `domain/repositories/` | `feature_repository.dart` |
| Repository Impl | `data/repositories/` | `feature_repository_impl.dart` |
| Use Case | `domain/usecases/` | `action_usecase.dart` |
| Remote Source | `data/remote/feature/` | `feature_remote_source.dart` |
| Notifier | `presentation/feature/provider/` | `feature_notifier.dart` |

## Quick Commands

```bash
# Generate code after changes
flutter pub run build_runner build --delete-conflicting-outputs

# Watch for changes (auto-generate)
flutter pub run build_runner watch --delete-conflicting-outputs

# Clean and rebuild
flutter clean && flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs

# Analyze code
flutter analyze
```

## Need Help?

1. Check existing implementations in the project
2. Read [CLEAN_ARCHITECTURE.md](./CLEAN_ARCHITECTURE.md)
3. View diagrams in [ARCHITECTURE_DIAGRAM.md](./ARCHITECTURE_DIAGRAM.md)
4. Review [MIGRATION_SUMMARY.md](./MIGRATION_SUMMARY.md)

---

**Remember:** When in doubt, follow the dependency rule: **Presentation → Domain ← Data**
