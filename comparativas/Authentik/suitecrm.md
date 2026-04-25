# Ficha Técnica: SuiteCRM

## Información General

| Campo | Valor |
|---|---|
| **Nombre** | SuiteCRM |
| **Desarrollador** | SalesAgility Ltd. |
| **Licencia** | AGPL-3.0 |
| **Repositorio** | https://github.com/salesagility/SuiteCRM |
| **Sitio oficial** | https://suitecrm.com |
| **Último commit** | Marzo 2025 |
| **Contribuidores** | 420+ |
| **Estrellas GitHub** | 4,300+ |
| **Lenguaje principal** | PHP + JavaScript |

---

## Descripción

SuiteCRM es un CRM de código abierto derivado de SugarCRM 6.5 (la última versión con licencia abierta). Mantiene compatibilidad con el ecosistema de SugarCRM mientras agrega funcionalidades avanzadas sin costo adicional. Es ampliamente adoptado en Europa y Latinoamérica como alternativa libre a Salesforce y HubSpot.

---

## Módulos Relevantes para LogiCore Solutions

- **AOS — Advanced Open Sales**: Gestión de cotizaciones, líneas de producto y órdenes de venta
- **Opportunities**: Pipeline de ventas con etapas personalizables y probabilidad de cierre
- **Accounts y Contacts**: Base de datos de clientes y contactos con historial completo
- **AOR — Advanced Open Reports**: Reportes y dashboards sin licencia adicional
- **Campaigns**: Gestión de campañas de marketing por correo electrónico
- **Cases**: Soporte al cliente y seguimiento de tickets

---

## Criterios de Evaluación

| Criterio | Calificación | Comentario |
|---|---|---|
| Licencia OSS | ✅ AGPL-3.0 | Garantiza que modificaciones también sean OSS |
| Comunidad | ✅ Activa | Foro oficial + GitHub Issues + Stack Overflow |
| Documentación | ✅ Muy buena | Documentación oficial + wiki comunitaria |
| Curva de aprendizaje | ✅ Media | Interfaz familiar para usuarios de SugarCRM/Salesforce |
| Compatibilidad | ✅ Docker / Linux | Imagen Bitnami disponible y mantenida |
| Soporte comercial | ✅ Disponible | SalesAgility ofrece planes de soporte |

---

## Ventajas

- Fork completamente libre, sin módulos de pago
- Módulo de ventas avanzadas (AOS) incluido en la versión base
- Amplia base de usuarios y recursos en español
- Compatible con instalación en cPanel/Plesk para hostings compartidos
- API REST para integraciones con ERPNext

## Desventajas

- Tecnología base (PHP + MySQL) más antigua que ERPNext
- La UI es menos moderna comparada con EspoCRM o HubSpot
- Las actualizaciones de versión mayor requieren planificación cuidadosa

---

## Integración en el Ecosistema LogiCore

```
SuiteCRM --[OAuth2/OIDC]--> Authentik (SSO)
SuiteCRM --[REST API]-----> ERPNext (Creación de órdenes al cerrar oportunidad)
ERPNext  --[REST API]-----> SuiteCRM (Consulta de inventario para cotizaciones)
SuiteCRM --[Webhook]------> Mattermost (Notificación de leads asignados)
```

---

## Referencias

- Documentación oficial: https://docs.suitecrm.com
- GitHub: https://github.com/salesagility/SuiteCRM
- Foro comunitario: https://community.suitecrm.com
- Soporte comercial: https://suitecrm.com/support
