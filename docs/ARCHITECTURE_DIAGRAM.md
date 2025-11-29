# Architecture Diagram

## Layer Dependencies

```
┌─────────────────────────────────────────────────────────────┐
│                    PRESENTATION LAYER                        │
│  ┌────────────────────────────────────────────────────┐     │
│  │  UI (Pages, Widgets)                                │     │
│  │  State Management (Notifiers/Controllers)           │     │
│  │                                                      │     │
│  │  Uses: Domain Entities (AuthUser, AuthRequest, etc)│     │
│  └────────────────────────────────────────────────────┘     │
└──────────────────────────┬──────────────────────────────────┘
                           │
                           │ depends on ↓
                           │
┌──────────────────────────▼──────────────────────────────────┐
│                      DOMAIN LAYER                            │
│  ┌────────────────────────────────────────────────────┐     │
│  │  Entities (Pure Dart Classes)                       │     │
│  │  Repository Interfaces (Abstract)                   │     │
│  │  Use Cases (Business Logic)                         │     │
│  │                                                      │     │
│  │  NO external dependencies - Pure business logic     │     │
│  └────────────────────────────────────────────────────┘     │
└──────────────────────────▲──────────────────────────────────┘
                           │
                           │ implements ↑
                           │
┌──────────────────────────┴──────────────────────────────────┐
│                       DATA LAYER                             │
│  ┌────────────────────────────────────────────────────┐     │
│  │  Models (DTOs with JSON serialization)             │     │
│  │  Mappers (Model ↔ Entity conversion)               │     │
│  │  Repository Implementations                         │     │
│  │  Remote Data Sources (API calls)                    │     │
│  └────────────────────────────────────────────────────┘     │
└─────────────────────────────────────────────────────────────┘
```

## Data Flow Example: Login

```
1. USER INTERACTION
   └─> LoginPage (UI)

2. PRESENTATION LAYER
   └─> AuthNotifier.login()
       └─> Creates: AuthRequest (Domain Entity)
           {username: "user", password: "pass"}

3. DOMAIN LAYER
   └─> LoginUseCase.call(AuthRequest)
       └─> Calls: AuthRepository.login() (interface)

4. DATA LAYER
   └─> AuthRepositoryImpl.login(AuthRequest)
       ├─> Mapper: AuthRequest → AuthRequestModel
       │   (Domain Entity → Data Model)
       ├─> AuthRemoteSource.login(AuthRequestModel)
       │   └─> HTTP POST to API
       │       └─> Returns: AuthResponseModel (from JSON)
       └─> Mapper: AuthResponseModel → AuthResponse
           (Data Model → Domain Entity)
           └─> Contains: AuthUser (Domain Entity)

5. BACK TO DOMAIN
   └─> LoginUseCase returns: AuthResponse (Domain Entity)

6. BACK TO PRESENTATION
   └─> AuthNotifier receives: AuthResponse
       └─> Stores: AuthUser (Domain Entity) in state

7. UI UPDATE
   └─> LoginPage displays user info
```

## File Structure with Responsibilities

```
lib/
│
├── presentation/                    [DEPENDS ON: domain]
│   ├── auth/
│   │   ├── provider/
│   │   │   └── auth_notifier.dart   → Uses AuthUser, AuthRequest entities
│   │   └── login_page.dart          → Displays AuthUser
│   │
│   └── input/
│       └── input_controller.dart    → Uses InputNominalRequest entity
│
├── domain/                          [DEPENDS ON: Nothing - Pure Dart]
│   ├── entities/                    → Plain Dart classes
│   │   ├── auth/
│   │   │   ├── auth_request.dart
│   │   │   ├── auth_user.dart
│   │   │   └── auth_response.dart
│   │   └── input/
│   │       ├── input_nominal_request.dart
│   │       └── input_nominal_response.dart
│   │
│   ├── repositories/                → Abstract interfaces
│   │   ├── auth_repository.dart
│   │   └── input_repository.dart
│   │
│   └── usecases/                    → Business logic
│       ├── login_usecase.dart
│       └── submit_input_nominal_usecase.dart
│
└── data/                            [DEPENDS ON: domain]
    ├── models/                      → DTOs with Freezed & JSON
    │   ├── auth/
    │   │   └── auth_model.dart      → AuthRequestModel, AuthUserModel
    │   └── input/
    │       └── input_nominal_model.dart
    │
    ├── mappers/                     → Conversion logic
    │   ├── auth/
    │   │   ├── auth_request_mapper.dart
    │   │   ├── auth_user_mapper.dart
    │   │   └── auth_response_mapper.dart
    │   └── input/
    │       ├── input_nominal_request_mapper.dart
    │       └── input_nominal_response_mapper.dart
    │
    ├── remote/                      → API communication
    │   ├── auth/
    │   │   └── auth_remote_source.dart
    │   └── input/
    │       └── input_remote_source.dart
    │
    └── repositories/                → Implements domain interfaces
        ├── auth_repository_impl.dart
        └── input_repository_impl.dart
```

## Key Architecture Rules

### ✅ ALLOWED

- Presentation → Domain (Use entities, call use cases)
- Data → Domain (Implement interfaces, convert to entities)
- Mappers convert: Data Models ↔ Domain Entities

### ❌ NOT ALLOWED

- Domain → Presentation (Domain is independent)
- Domain → Data (Domain doesn't know about data sources)
- Presentation → Data Models (Must use domain entities)

## Benefits Visualization

```
┌─────────────────────────────────────────────────────────────┐
│                    TESTABILITY                               │
├─────────────────────────────────────────────────────────────┤
│  Presentation  │  Can mock use cases                         │
│  Domain        │  Test pure business logic independently     │
│  Data          │  Can mock API responses                     │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│                    FLEXIBILITY                               │
├─────────────────────────────────────────────────────────────┤
│  Change UI?    │  Swap Flutter for other framework           │
│  Change API?   │  Add new data source, update mappers        │
│  Add Cache?    │  New data source + repository update        │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│                    MAINTAINABILITY                           │
├─────────────────────────────────────────────────────────────┤
│  API changes?  │  Update models & mappers only               │
│  New business  │  Add use case in domain layer               │
│  rule?         │                                              │
│  UI redesign?  │  Change presentation layer only             │
└─────────────────────────────────────────────────────────────┘
```
