# 🏢 LogiCore Solutions — Ecosistema OSS

**Proyecto 2 | Sistemas y Lenguajes de Código Abierto | Universidad Panamericana**

---

## 📋 Descripción del Proyecto

Este repositorio contiene la evidencia técnica del Proyecto 2: análisis comparativo y propuesta de ecosistema OSS para **LogiCore Solutions S.A. de C.V.**, una empresa de logística y distribución de 100 colaboradores con sede en Ciudad de México.

El objetivo fue seleccionar, analizar y proponer un conjunto coherente de soluciones de software de código abierto para cubrir las necesidades tecnológicas de la organización, argumentando cada decisión con criterios técnicos, económicos y comunitarios.

---

## 🏗️ Organización Ficticia

| Atributo | Valor |
|---|---|
| **Nombre** | LogiCore Solutions S.A. de C.V. |
| **Giro** | Logística y distribución (B2B y B2C) |
| **Tamaño** | 100 colaboradores |
| **Sede** | Ciudad de México (+ sucursales en Monterrey y Guadalajara) |
| **Restricciones** | Presupuesto limitado + privacidad de datos |

---

## 🛠️ Ecosistema OSS Seleccionado

| Área | Herramienta | Licencia | Función |
|---|---|---|---|
| ERP / Gestión empresarial | **ERPNext** | GPL-3.0 | Inventario, ventas, finanzas, compras |
| CRM / Clientes | **SuiteCRM** | AGPL-3.0 | Pipeline de ventas, cotizaciones |
| IAM / Identidades | **Authentik** | MIT | SSO, MFA, gestión de accesos |
| Comunicación interna | **Mattermost** | MIT | Chat, canales, notificaciones |

---

## 📁 Estructura del Repositorio

```
├── README.md                          # Este archivo
├── docker-compose.yml                 # Despliegue completo del ecosistema
├── install.sh                         # Script de instalación automatizada
├── comparativas/
│   ├── erpnext.md                     # Ficha técnica ERPNext
│   ├── suitecrm.md                    # Ficha técnica SuiteCRM
│   ├── authentik.md                   # Ficha técnica Authentik
│   ├── mattermost.md                  # Ficha técnica Mattermost
│   └── alternativas_descartadas.md    # Herramientas evaluadas y no seleccionadas
└── propuesta/
    └── ecosistema.mmd                 # Diagrama Mermaid del ecosistema OSS
```

---

## 🚀 Despliegue Rápido

### Prerrequisitos
- Ubuntu 22.04 LTS
- Docker Engine 24.x+
- Docker Compose 2.x+
- 4GB RAM mínimo, 8GB recomendado
- 50GB disco libre

### Instalación

```bash
# Clonar el repositorio
git clone https://github.com/logicore-oss/ecosistema.git
cd ecosistema

# Ejecutar script de instalación
chmod +x install.sh
./install.sh

# O desplegar manualmente con Docker Compose
docker compose up -d
```

### Acceso a los servicios

| Servicio | URL local | Puerto |
|---|---|---|
| Authentik | http://localhost:9000 | 9000 |
| ERPNext | http://localhost:8080 | 8080 |
| SuiteCRM | http://localhost:8081 | 8081 |
| Mattermost | http://localhost:8065 | 8065 |

---

## 👥 Integrantes del Equipo

- Bruno (Universidad Panamericana — Ingeniería en Computación)

---

## 📚 Referencias

- [ERPNext Docs](https://docs.erpnext.com)
- [SuiteCRM Docs](https://docs.suitecrm.com)
- [Authentik Docs](https://goauthentik.io/docs)
- [Mattermost Docs](https://docs.mattermost.com)
