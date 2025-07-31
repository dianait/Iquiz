# Iquiz

Una aplicación de trivia/quiz desarrollada en SwiftUI para iOS.

## 🚀 Características

- Interfaz de usuario moderna y intuitiva
- Sistema de preguntas y respuestas
- Ranking de puntuaciones
- Almacenamiento local de datos
- Diseño responsive

## 📱 Tecnologías

- **SwiftUI** - Framework de interfaz de usuario
- **Swift** - Lenguaje de programación
- **UserDefaults** - Almacenamiento local
- **SwiftLint** - Linting y estilo de código

## 🛠️ Configuración del Proyecto

### Requisitos Previos

- Xcode 14.0 o superior
- iOS 16.0 o superior
- macOS 13.0 o superior (para desarrollo)

### Instalación

1. Clona el repositorio:
   ```bash
   git clone <url-del-repositorio>
   cd Iquiz
   ```

2. Abre el proyecto en Xcode:
   ```bash
   open Iquiz.xcodeproj
   ```

3. Configura SwiftLint (opcional pero recomendado):
   ```bash
   ./setup-swiftlint.sh
   ```

## 🔧 SwiftLint y Pre-commit Hook

Este proyecto incluye configuración automática de SwiftLint con un hook de pre-commit que:

- ✅ Verifica automáticamente el estilo del código antes de cada commit
- 🚫 Bloquea commits con errores de linting
- 📝 Solo verifica archivos Swift modificados
- ⚙️ Configuración personalizada para el proyecto

### Configuración Rápida

```bash
./setup-swiftlint.sh
```

Para más detalles, consulta [SWIFTLINT_SETUP.md](SWIFTLINT_SETUP.md).

## 📁 Estructura del Proyecto

```
Iquiz/
├── Iquiz/
│   ├── Components/          # Componentes reutilizables
│   ├── Data/               # Modelos de datos y API
│   ├── Views/              # Vistas principales
│   ├── Mocks/              # Datos de prueba
│   └── IquizApp.swift      # Punto de entrada
├── Tests/                  # Tests unitarios
├── UITests/                # Tests de interfaz
└── Configuración/
    ├── .swiftlint.yml      # Configuración de SwiftLint
    ├── setup-swiftlint.sh  # Script de configuración
    └── SWIFTLINT_SETUP.md  # Documentación de SwiftLint
```

## 🧪 Testing

### Tests Unitarios
```bash
# Ejecutar tests unitarios
xcodebuild test -scheme Iquiz -destination 'platform=iOS Simulator,name=iPhone 14'
```

### Tests de UI
```bash
# Ejecutar tests de UI
xcodebuild test -scheme Iquiz -destination 'platform=iOS Simulator,name=iPhone 14' -only-testing:UITests
```

## 📦 Build y Distribución

### Build para Simulador
```bash
xcodebuild build -scheme Iquiz -destination 'platform=iOS Simulator,name=iPhone 14'
```

### Build para Dispositivo
```bash
xcodebuild build -scheme Iquiz -destination 'platform=iOS,name=iPhone'
```

## 🤝 Contribución

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

### Guías de Contribución

- Sigue las convenciones de SwiftLint configuradas
- Añade tests para nuevas funcionalidades
- Mantén la documentación actualizada
- Usa commits descriptivos

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

## 👥 Autores

- **Tu Nombre** - *Desarrollo inicial* - [TuUsuario](https://github.com/TuUsuario)

## 🙏 Agradecimientos

- [SwiftUI](https://developer.apple.com/xcode/swiftui/) por el framework de UI
- [SwiftLint](https://github.com/realm/SwiftLint) por las herramientas de linting
- [Open Trivia Database](https://opentdb.com/) por las preguntas de trivia

