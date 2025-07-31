# Configuración de SwiftLint con Pre-commit Hook

Este proyecto incluye un hook de pre-commit que ejecuta automáticamente SwiftLint antes de cada commit para asegurar que el código cumpla con las reglas de estilo.

## 🚀 Configuración Rápida

### Opción 1: Script Automático
```bash
./setup-swiftlint.sh
```

### Opción 2: Configuración Manual

1. **Instalar SwiftLint:**
   ```bash
   brew install swiftlint
   ```

2. **Verificar que el hook esté activo:**
   ```bash
   ls -la .git/hooks/pre-commit
   ```

3. **Hacer el hook ejecutable (si no lo está):**
   ```bash
   chmod +x .git/hooks/pre-commit
   ```

## 📋 Cómo Funciona

### Pre-commit Hook
El hook se ejecuta automáticamente antes de cada commit y:

1. ✅ Verifica que SwiftLint esté instalado
2. 📝 Identifica archivos Swift modificados
3. 🔧 Ejecuta SwiftLint en esos archivos
4. 🚫 Bloquea el commit si hay errores de linting
5. ✅ Permite el commit si todo está correcto

### Configuración de SwiftLint
El archivo `.swiftlint.yml` define las reglas de estilo:

- **Reglas deshabilitadas:** Algunas reglas estrictas están deshabilitadas para mayor flexibilidad
- **Reglas opcionales:** Se habilitan reglas adicionales útiles
- **Límites configurables:** Longitud de líneas, funciones, etc.
- **Exclusiones:** Directorios de tests y dependencias excluidos

## 🛠️ Uso Diario

### Hacer un Commit
```bash
git add .
git commit -m "Tu mensaje de commit"
```
El hook se ejecutará automáticamente.

### Verificar Linting Manualmente
```bash
# Verificar todo el proyecto
swiftlint lint

# Verificar archivos específicos
swiftlint lint Iquiz/Views/QuestionView.swift

# Verificar con autocorrección (cuidado)
swiftlint lint --fix
```

### Si el Commit Falla
Si el hook bloquea el commit:

1. **Ver los errores:**
   ```bash
   swiftlint lint
   ```

2. **Corregir los errores** en tu código

3. **Volver a intentar el commit:**
   ```bash
   git add .
   git commit -m "Tu mensaje de commit"
   ```

## ⚙️ Personalización

### Modificar Reglas
Edita el archivo `.swiftlint.yml` para:

- Habilitar/deshabilitar reglas específicas
- Ajustar límites (longitud de líneas, funciones, etc.)
- Agregar exclusiones de archivos

### Deshabilitar Temporalmente
Si necesitas hacer un commit sin linting (no recomendado):

```bash
git commit --no-verify -m "Commit de emergencia"
```

## 🔧 Solución de Problemas

### SwiftLint No Instalado
```bash
brew install swiftlint
```

### Hook No Ejecutable
```bash
chmod +x .git/hooks/pre-commit
```

### Errores de Configuración
Verifica que el archivo `.swiftlint.yml` esté en la raíz del proyecto.

### Problemas de Permisos
```bash
sudo chown -R $(whoami) .git/hooks/
chmod +x .git/hooks/pre-commit
```

## 📚 Recursos Adicionales

- [Documentación oficial de SwiftLint](https://github.com/realm/SwiftLint)
- [Reglas de SwiftLint](https://realm.github.io/SwiftLint/rule-directory.html)
- [Git Hooks Documentation](https://git-scm.com/docs/githooks)

## 🤝 Contribución

Si encuentras problemas o quieres mejorar la configuración:

1. Revisa los logs del hook
2. Verifica la configuración de SwiftLint
3. Propón mejoras en el archivo de configuración 