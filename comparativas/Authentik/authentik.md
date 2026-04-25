# Ficha Técnica: Authentik

## Información General

| Campo | Valor |
|---|---|
| **Nombre** | Authentik |
| **Desarrollador** | Authentik Security Inc. |
| **Licencia** | MIT |
| **Repositorio** | https://github.com/goauthentik/authentik |
| **Sitio oficial** | https://goauthentik.io |
| **Último commit** | Abril 2025 |
| **Contribuidores** | 680+ |
| **Estrellas GitHub** | 14,000+ |
| **Lenguaje principal** | Python (Django) + TypeScript |

---

## Descripción

Authentik es una plataforma de gestión de identidades y accesos (IAM) de código abierto moderna y extensible. Funciona como Identity Provider (IdP) compatible con SAML 2.0, OAuth 2.0, OpenID Connect (OIDC) y LDAP, permitiendo implementar Single Sign-On (SSO) y Multi-Factor Authentication (MFA) para cualquier aplicación de la organización.

---

## Funcionalidades Clave para LogiCore Solutions

- **SSO centralizado**: Un solo login para ERPNext, SuiteCRM, Mattermost y cualquier aplicación futura
- **MFA**: Autenticación de doble factor via TOTP (Google Authenticator), WebAuthn y SMS
- **Flows personalizables**: Diseño de journeys de autenticación sin programación (enrollment, recovery, MFA)
- **Grupos y permisos**: Gestión de roles por departamento sincronizable con cada aplicación
- **Outposts**: Proxy de autenticación para aplicaciones que no soportan SSO nativo
- **Auditoría**: Log completo de eventos de autenticación exportable a SIEM

---

## Criterios de Evaluación

| Criterio | Calificación | Comentario |
|---|---|---|
| Licencia OSS | ✅ MIT | La más permisiva del grupo evaluado |
| Comunidad | ✅ Muy activa | Crecimiento acelerado 2022-2025, Discord activo |
| Documentación | ✅ Excelente | Docs detallados con ejemplos por aplicación |
| Curva de aprendizaje | ✅ Media | Más amigable que Keycloak para equipos pequeños |
| Compatibilidad | ✅ Docker / K8s | docker-compose.yml oficial incluido |
| Soporte comercial | ✅ Enterprise disponible | Authentik Enterprise con SLA y soporte dedicado |

---

## Protocolos Soportados

| Protocolo | Uso en LogiCore |
|---|---|
| SAML 2.0 | Integración con ERPNext |
| OAuth 2.0 / OIDC | Integración con SuiteCRM y Mattermost |
| LDAP | Compatibilidad con aplicaciones legacy |
| SCIM | Sincronización automática de usuarios |
| Proxy | Protección de apps sin soporte SSO nativo |

---

## Ventajas

- Licencia MIT sin restricciones de uso comercial
- UI moderna e intuitiva vs la consola de Keycloak
- Instalación en menos de 30 minutos con Docker Compose oficial
- Outposts para proteger apps sin SSO nativo (útil para futuras integraciones)
- Actualizaciones frecuentes con excelente changelog

## Desventajas

- Proyecto más joven que Keycloak (menos historial en producción crítica)
- Menor número de contribuidores que Keycloak
- Algunas integraciones enterprise requieren la versión de pago

---

## Integración en el Ecosistema LogiCore

```
Authentik (IdP central)
   ├── ERPNext     ← SAML 2.0
   ├── SuiteCRM    ← OAuth2 / OIDC
   ├── Mattermost  ← OIDC (GitLab provider compatible)
   └── Futuras apps← Outpost Proxy
```

---

## Configuración Básica de SSO para ERPNext (SAML)

```yaml
# En Authentik: crear Application + SAML Provider
# ACS URL: https://erpnext.logicore.mx/api/method/frappe.integrations.oauth2_logins.login_via_saml
# Entity ID: https://authentik.logicore.mx
# NameID Format: emailAddress
```

---

## Referencias

- Documentación oficial: https://goauthentik.io/docs
- GitHub: https://github.com/goauthentik/authentik
- Discord comunitario: https://discord.gg/jg33eMhnj6
- Integraciones: https://goauthentik.io/integrations
