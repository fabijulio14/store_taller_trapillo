# Taller Trapillo Store 🧶

Una aplicación Flutter para una tienda de productos tejidos a mano con trapillo (cuerda de algodón). La aplicación permite navegar por productos, ver detalles, gestionar favoritos y filtrar por categorías.

## 📱 Descripción del Proyecto

Taller Trapillo Store es una aplicación móvil desarrollada en Flutter que presenta una tienda virtual especializada en productos tejidos a mano como bolsos, cestas y accesorios. La aplicación implementa una arquitectura limpia y escalable utilizando el patrón Clean Architecture junto con Riverpod para la gestión de estado.

## 🏗️ Arquitectura del Proyecto

### Patrón de Arquitectura: Clean Architecture + Feature-First

La aplicación sigue una arquitectura híbrida que combina:
- **Clean Architecture**: Separación clara de responsabilidades en capas
- **Feature-First Structure**: Organización por características/funcionalidades
- **Riverpod**: Para gestión de estado reactiva y dependency injection

### 📁 Estructura de Directorios

```
lib/
├── main.dart                    # Punto de entrada de la aplicación
├── commons/                     # Componentes compartidos
│   └── widgets/                # Widgets reutilizables
│       ├── product_detail.dart # Modal de detalle del producto
│       ├── products_list.dart  # Lista de productos
│       └── ...
├── core/                       # Configuración central
│   └── features/
│       └── app_colors.dart     # Paleta de colores de la app
├── features/                   # Características principales
│   ├── login/                  # Módulo de autenticación
│   │   └── ui/
│   │       └── screen/
│   │           └── login_screen.dart
│   └── lobby_store/           # Módulo principal de la tienda
│       ├── data/              # Capa de datos
│       │   ├── models/        # Modelos de datos
│       │   └── repositories/  # Repositorios
│       ├── domain/            # Lógica de negocio
│       └── ui/                # Interfaz de usuario
│           ├── screens/       # Pantallas
│           ├── widgets/       # Widgets específicos
│           └── view_models/   # Controladores de estado
└── l10n/                      # Internacionalización
    ├── app_es.arb            # Textos en español
    ├── app_en.arb            # Textos en inglés
    └── generated/            # Archivos generados
```

### 🔄 Capas de la Arquitectura

#### 1. **Presentation Layer (UI)**
- **Ubicación**: `features/*/ui/`
- **Responsabilidades**:
  - Widgets y pantallas
  - Gestión de estado con Riverpod
  - Interacción del usuario
- **Componentes principales**:
  - `LobbyStoreScreen`: Pantalla principal con categorías, promociones y productos destacados
  - `LoginScreen`: Pantalla de autenticación
  - `ProductDetail`: Modal con información detallada del producto

#### 2. **Domain Layer (Lógica de Negocio)**
- **Ubicación**: `features/*/domain/`
- **Responsabilidades**:
  - Entidades de negocio
  - Casos de uso
  - Interfaces de repositorios

#### 3. **Data Layer (Datos)**
- **Ubicación**: `features/*/data/`
- **Responsabilidades**:
  - Modelos de datos
  - Implementación de repositorios
  - Fuentes de datos (API, local storage)
- **Componentes principales**:
  - `Product`: Modelo de producto con propiedades como id, nombre, precio, imagen, etc.

### 📦 Gestión de Estado con Riverpod

La aplicación utiliza **Riverpod** como solución de gestión de estado:

```dart
// Ejemplo de providers
final productListViewModelProvider = StateNotifierProvider<ProductListViewModel, AsyncValue<List<Product>>>();
final favoritesListViewModelProvider = StateNotifierProvider<FavoritesListViewModel, List<Product>>();
```

#### ViewModels Principales:
- `ProductListViewModel`: Gestiona la lista de productos y filtros
- `FavoritesListViewModel`: Maneja la lista de productos favoritos

### 🧊 Modelos de Datos con Freezed

La aplicación utiliza **Freezed** para crear modelos inmutables y con funcionalidades avanzadas:

#### Características de Freezed implementadas:
- **Inmutabilidad**: Todos los campos son `final`
- **Serialización JSON**: Conversión automática desde/hacia JSON
- **Métodos automáticos**: `toString()`, `operator ==`, `hashCode`, `copyWith()`
- **Valores por defecto**: Con la anotación `@Default()`

#### Ejemplo de modelo Product:
```dart
@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String name,
    required String description,
    required String image,
    required double price,
    double? promoPrice,
    @Default(false) bool featured,
    required String category,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  
  // Factory personalizado para mapear 'promo_price' del API
  factory Product.fromJsonCustom(Map<String, dynamic> json) {
    final modifiedJson = Map<String, dynamic>.from(json);
    if (modifiedJson.containsKey('promo_price')) {
      modifiedJson['promoPrice'] = modifiedJson.remove('promo_price');
    }
    return _$ProductFromJson(modifiedJson);
  }
}
```

#### Beneficios de usar Freezed:
- **Código generado automáticamente**: Menos boilerplate manual
- **Inmutabilidad garantizada**: Previene modificaciones accidentales
- **Serialización robusta**: Manejo automático de JSON
- **Mejor debugging**: Métodos `toString()` informativos
- **Performance**: Implementaciones optimizadas de `==` y `hashCode`

### 🔥 ¿Por qué Freezed en este proyecto?

**Freezed** es fundamental en la arquitectura del proyecto por las siguientes razones:

#### 🎯 Ventajas específicas implementadas:

1. **Modelos de Datos Robustos**:
   ```dart
   // Sin Freezed (problemático)
   class Product {
     final int id;
     final String name;
     // ... más propiedades
     
     // Necesitamos escribir manualmente:
     // - constructor
     // - toString()
     // - operator ==
     // - hashCode
     // - copyWith()
     // - fromJson/toJson
   }
   
   // Con Freezed (automático)
   @freezed
   class Product with _$Product {
     const factory Product({...}) = _Product;
     factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
   }
   ```

2. **Serialización JSON Inteligente**:
   ```dart
   // Manejo automático de diferencias entre API y modelo
   factory Product.fromJsonCustom(Map<String, dynamic> json) {
     final modifiedJson = Map<String, dynamic>.from(json);
     if (modifiedJson.containsKey('promo_price')) {
       modifiedJson['promoPrice'] = modifiedJson.remove('promo_price');
     }
     return _$ProductFromJson(modifiedJson);
   }
   ```

3. **Seguridad de Tipos**: Previene errores en tiempo de compilación
4. **Performance**: Implementaciones optimizadas de métodos esenciales
5. **Debugging**: `toString()` automático con información clara

#### 🧪 Estados Complejos (Futuras implementaciones):
```dart
@freezed
class ProductListState with _$ProductListState {
  const factory ProductListState.initial() = _Initial;
  const factory ProductListState.loading() = _Loading;
  const factory ProductListState.loaded(List<Product> products) = _Loaded;
  const factory ProductListState.error(String message) = _Error;
}
```

#### 📂 Archivos Generados:
- `product_model.dart`: Código fuente
- `product_model.freezed.dart`: Código generado por Freezed
- `product_model.g.dart`: Código de serialización JSON

### 🌐 Internacionalización (i18n)

La aplicación soporta múltiples idiomas:
- **Configuración**: `l10n.yaml`
- **Idiomas soportados**: Español (es), Inglés (en)
- **Archivos de traducción**: `app_es.arb`, `app_en.arb`
- **Generación automática**: `AppLocalizations` generado automáticamente

### 🎨 Sistema de Diseño

#### Colores
- **Archivo**: `core/features/app_colors.dart`
- **Colores principales**:
  - Primary: Color principal de la marca
  - Secondary: Color secundario
  - Rose: Color rosa para elementos específicos

#### Componentes Reutilizables
- `ProductDetail`: Modal para mostrar información del producto
- `ProductsList`: Grid de productos con filtros
- `PromotionsSection`: Sección de productos en promoción
- `CategoriesSection`: Selector de categorías
- `BestSellersSection`: Productos más vendidos

### 🛠️ Tecnologías y Dependencias

#### Dependencias Principales
```yaml
dependencies:
  flutter: sdk
  flutter_riverpod: ^2.6.1      # Gestión de estado
  riverpod_annotation: ^2.0.0   # Anotaciones para Riverpod
  freezed_annotation: ^2.4.1    # Anotaciones para Freezed
  http: ^1.2.1                  # Cliente HTTP
  dio: ^5.4.0                   # Cliente HTTP avanzado
  flutter_localizations: sdk   # Internacionalización
  intl: ^0.19.0                # Formateo de números y fechas

dev_dependencies:
  riverpod_generator: ^2.0.0    # Generador de código para Riverpod
  freezed: ^2.4.7              # Generador de código para modelos inmutables
  json_serializable: ^6.7.1    # Serialización JSON automática
  build_runner: ^2.0.0         # Herramientas de build
  flutter_lints: ^5.0.0        # Análisis de código
```

### 🔗 API y Datos

#### Mock API (Mockoon)
- **Archivo**: `mockoon/products_services.json`
- **Endpoint**: `GET /getProducts`
- **Puerto**: 3001
- **Estructura de producto**:
  ```json
  {
    "id": 1,
    "name": "Bolso Liz",
    "description": "Bolso Liz, varios colores.",
    "price": 12.99,
    "promo_price": 10.99,
    "featured": true,
    "image": "assets/images/bolso_1.png",
    "category": "Bolso"
  }
  ```

### 📱 Funcionalidades Implementadas

#### Pantalla Principal (Lobby Store)
- ✅ Navegación por categorías (Bolsos, Canastas, Accesorios)
- ✅ Sección de promociones
- ✅ Productos más vendidos
- ✅ Gestión de favoritos
- ✅ Filtrado por categorías

#### Gestión de Productos
- ✅ Lista de productos con grid layout
- ✅ Modal de detalle con información completa
- ✅ Formateo de precios con descuentos
- ✅ Imágenes de productos optimizadas

#### Sistema de Favoritos
- ✅ Agregar/quitar productos de favoritos
- ✅ Persistencia de favoritos en memoria
- ✅ Indicador visual en el detalle del producto

### 🚀 Configuración de Desarrollo

#### Prerrequisitos
- Flutter SDK ^3.29.3
- Dart SDK ^3.7.2

#### Instalación
```bash
# Clonar el repositorio
git clone [repository-url]

# Navegar al directorio
cd taller_trapillo_store

# Instalar dependencias
flutter pub get

# Generar código (Riverpod + Freezed + i18n)
dart run build_runner build

# Ejecutar la aplicación
flutter run
```

#### Estructura de Build
```bash
# Generar archivos de localización
flutter gen-l10n

# Generar código de Riverpod y Freezed
dart run build_runner build --delete-conflicting-outputs

# Generar en modo watch (desarrollo)
dart run build_runner watch
```

### 📱 Plataformas Soportadas

- ✅ **Android**: Configuración completa en `android/`
- ✅ **iOS**: Configuración completa en `ios/`
- ✅ **Linux**: Configuración CMake en `linux/`
- ✅ **macOS**: Configuración nativa en `macos/`
- ✅ **Windows**: Configuración CMake en `windows/`
- ✅ **Web**: Configuración básica en `web/`

### 🎯 Patrones de Diseño Utilizados

1. **Repository Pattern**: Para abstracción de fuentes de datos
2. **MVVM**: Model-View-ViewModel con Riverpod
3. **Provider Pattern**: Para dependency injection
4. **Observer Pattern**: A través de Riverpod para cambios de estado
5. **Factory Pattern**: Para creación de modelos (con Freezed)
6. **Immutable Pattern**: Modelos inmutables con Freezed

### 📄 Assets y Recursos

#### Imágenes
- **Ubicación**: `assets/images/`
- **Tipos de productos**:
  - Bolsos: `bolso_1.png`, `bolso_2.png`, `bolso_naranja.png`
  - Cestas: `cesta_conejo.png`, `cesta_navidad.png`, `cesta_oveja.png`
  - Accesorios: `llavero_abeja.png`, `llavero_lazos.png`, `llavero_mariposa.png`
  - Otros: `alfombra_1.png`, `cesto_1.png`

### 🧪 Testing

La aplicación incluye configuración básica para testing:
- **Archivo**: `test/widget_test.dart`
- **Framework**: Flutter Test Framework

### 🔧 Configuración de Análisis

```yaml
# analysis_options.yaml
include: package:flutter_lints/flutter.yaml
```

### 📋 Próximas Funcionalidades

#### 🛒 Funcionalidades de Negocio
- [ ] Carrito de compras
- [ ] Proceso de checkout
- [ ] Autenticación con backend
- [ ] Sistema de reseñas
- [ ] Notificaciones push

#### 🔧 Mejoras Técnicas
- [ ] Estados complejos con Freezed (Loading, Error, Success)
- [ ] Persistencia local de favoritos (Hive/SQLite)
- [ ] Filtros avanzados con estados inmutables
- [ ] Cache de imágenes optimizado
- [ ] Testing unitario con modelos Freezed
- [ ] Offline-first architecture

---

## 🤝 Contribución

Para contribuir al proyecto:

1. Fork el repositorio
2. Crea una rama feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Ver el archivo `LICENSE` para más detalles.

---

**Desarrollado con ❤️ usando Flutter, Riverpod & Freezed**

### 🚀 Stack Tecnológico Moderno:
- **Flutter**: Framework UI multiplataforma
- **Riverpod**: Gestión de estado reactiva
- **Freezed**: Modelos inmutables con código generado
- **Clean Architecture**: Separación de responsabilidades
- **Feature-First**: Organización escalable
