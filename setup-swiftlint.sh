#!/bin/bash
#
# Script para configurar SwiftLint y el hook de pre-commit
# Ejecuta este script una vez para configurar el entorno de linting

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo "${BLUE}🚀 Configurando SwiftLint y pre-commit hook...${NC}"

# Verificar si Homebrew está instalado
if ! command -v brew &> /dev/null; then
    echo "${RED}❌ Homebrew no está instalado.${NC}"
    echo "Por favor, instala Homebrew primero:"
    echo "  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    exit 1
fi

# Instalar SwiftLint si no está instalado
if ! command -v swiftlint &> /dev/null; then
    echo "${YELLOW}📦 Instalando SwiftLint...${NC}"
    brew install swiftlint
    echo "${GREEN}✅ SwiftLint instalado correctamente.${NC}"
else
    echo "${GREEN}✅ SwiftLint ya está instalado.${NC}"
fi

# Verificar que el hook de pre-commit existe
if [ ! -f ".git/hooks/pre-commit" ]; then
    echo "${RED}❌ El hook de pre-commit no existe.${NC}"
    echo "Por favor, asegúrate de que el archivo .git/hooks/pre-commit esté creado."
    exit 1
fi

# Hacer el hook ejecutable
chmod +x .git/hooks/pre-commit
echo "${GREEN}✅ Hook de pre-commit configurado como ejecutable.${NC}"

# Verificar que el archivo de configuración existe
if [ ! -f ".swiftlint.yml" ]; then
    echo "${RED}❌ El archivo .swiftlint.yml no existe.${NC}"
    echo "Por favor, asegúrate de que el archivo de configuración esté creado."
    exit 1
fi

echo "${GREEN}✅ Configuración completada.${NC}"
echo ""
echo "${BLUE}📋 Resumen de la configuración:${NC}"
echo "  • SwiftLint instalado y configurado"
echo "  • Hook de pre-commit activo"
echo "  • Archivo de configuración .swiftlint.yml creado"
echo ""
echo "${YELLOW}💡 Próximos pasos:${NC}"
echo "  1. Haz un commit de prueba para verificar que todo funciona"
echo "  2. Si hay errores de linting, corrígelos antes de hacer commit"
echo "  3. Puedes ejecutar 'swiftlint lint' manualmente para ver todos los errores"
echo ""
echo "${GREEN}🎉 ¡Configuración completada exitosamente!${NC}" 