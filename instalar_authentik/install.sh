#!/bin/bash
# ============================================================
# LogiCore Solutions — Script de instalación del ecosistema OSS
# ERPNext + SuiteCRM + Authentik + Mattermost
# Probado en: Ubuntu 22.04 LTS
# ============================================================

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info()    { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[OK]${NC} $1"; }
log_warn()    { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error()   { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

echo ""
echo "======================================================"
echo "  LogiCore Solutions — Instalador de Ecosistema OSS"
echo "======================================================"
echo ""

# ── 1. Verificar privilegios ──────────────────────────────
if [[ "$EUID" -ne 0 ]]; then
  log_error "Este script debe ejecutarse como root o con sudo."
fi

# ── 2. Verificar SO ───────────────────────────────────────
if ! grep -q "Ubuntu" /etc/os-release 2>/dev/null; then
  log_warn "Sistema operativo no es Ubuntu. Continuando de todas formas..."
fi

log_info "Actualizando paquetes del sistema..."
apt-get update -qq
apt-get install -y -qq curl git ca-certificates gnupg lsb-release

# ── 3. Instalar Docker si no está presente ────────────────
if ! command -v docker &>/dev/null; then
  log_info "Instalando Docker Engine..."
  install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  chmod a+r /etc/apt/keyrings/docker.gpg

  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
    https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null

  apt-get update -qq
  apt-get install -y -qq docker-ce docker-ce-cli containerd.io docker-compose-plugin
  systemctl enable docker
  systemctl start docker
  log_success "Docker instalado correctamente."
else
  log_success "Docker ya está instalado: $(docker --version)"
fi

# ── 4. Verificar Docker Compose ───────────────────────────
if ! docker compose version &>/dev/null; then
  log_error "Docker Compose plugin no encontrado. Instálalo manualmente."
fi
log_success "Docker Compose: $(docker compose version --short)"

# ── 5. Crear directorios necesarios ───────────────────────
log_info "Creando directorios de datos..."
mkdir -p media custom-templates
log_success "Directorios creados."

# ── 6. Generar archivo .env con credenciales seguras ──────
if [[ ! -f .env ]]; then
  log_info "Generando archivo .env con contraseñas aleatorias..."
  cat > .env <<EOF
# Credenciales generadas automáticamente — NO COMPARTIR
# Generado: $(date)

# Authentik
AUTHENTIK_SECRET_KEY=$(openssl rand -hex 32)
AUTHENTIK_DB_PASSWORD=$(openssl rand -base64 20 | tr -dc 'A-Za-z0-9!@#' | head -c 20)
REDIS_PASSWORD=$(openssl rand -base64 16 | tr -dc 'A-Za-z0-9' | head -c 16)

# ERPNext
ERPNEXT_DB_ROOT_PASSWORD=$(openssl rand -base64 20 | tr -dc 'A-Za-z0-9!@#' | head -c 20)
ERPNEXT_DB_PASSWORD=$(openssl rand -base64 20 | tr -dc 'A-Za-z0-9!@#' | head -c 20)

# SuiteCRM
SUITECRM_DB_ROOT_PASSWORD=$(openssl rand -base64 20 | tr -dc 'A-Za-z0-9!@#' | head -c 20)
SUITECRM_DB_PASSWORD=$(openssl rand -base64 20 | tr -dc 'A-Za-z0-9!@#' | head -c 20)
SUITECRM_ADMIN_PASSWORD=$(openssl rand -base64 16 | tr -dc 'A-Za-z0-9!@#' | head -c 16)

# Mattermost
MATTERMOST_DB_PASSWORD=$(openssl rand -base64 20 | tr -dc 'A-Za-z0-9!@#' | head -c 20)
MM_OAUTH_ID=mattermost-client-id-$(openssl rand -hex 8)
MM_OAUTH_SECRET=$(openssl rand -hex 32)
EOF
  log_success "Archivo .env generado. Guárdalo en un lugar seguro."
else
  log_warn ".env ya existe. Usando credenciales existentes."
fi

# ── 7. Desplegar servicios ────────────────────────────────
log_info "Iniciando servicios con Docker Compose..."
docker compose pull
docker compose up -d

# ── 8. Esperar a que los servicios estén listos ───────────
log_info "Esperando a que los servicios inicialicen (60 segundos)..."
sleep 60

# ── 9. Verificar estado de servicios ─────────────────────
echo ""
log_info "Estado de los contenedores:"
docker compose ps

# ── 10. Resumen de acceso ─────────────────────────────────
echo ""
echo "======================================================"
echo -e "${GREEN}  Instalación completada${NC}"
echo "======================================================"
echo ""
echo "Accede a los servicios en:"
echo ""
echo -e "  ${BLUE}Authentik (IAM/SSO):${NC}    http://localhost:9000"
echo -e "  ${BLUE}ERPNext (ERP):${NC}          http://localhost:8080"
echo -e "  ${BLUE}SuiteCRM (CRM):${NC}         http://localhost:8081"
echo -e "  ${BLUE}Mattermost (Chat):${NC}      http://localhost:8065"
echo ""
echo "Credenciales en: .env"
echo ""
echo -e "${YELLOW}IMPORTANTE:${NC} Para producción, configura un reverse proxy"
echo "con Nginx y certificados SSL de Let's Encrypt."
echo "======================================================"
