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

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.
