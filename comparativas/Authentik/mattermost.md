# Ficha Técnica: Mattermost

## Información General

| Campo | Valor |
|---|---|
| **Nombre** | Mattermost (Team Edition) |
| **Desarrollador** | Mattermost Inc. |
| **Licencia** | MIT (Team Edition) |
| **Repositorio** | https://github.com/mattermost/mattermost |
| **Sitio oficial** | https://mattermost.com |
| **Último commit** | Abril 2025 |
| **Contribuidores** | 900+ |
| **Estrellas GitHub** | 30,000+ |
| **Lenguaje principal** | Go (backend) + React (frontend) |

---

## Descripción

Mattermost es una plataforma de comunicación empresarial autohospedada, diseñada como alternativa open-source a Slack y Microsoft Teams. La Team Edition (MIT) incluye mensajería en tiempo real, canales, mensajes directos, búsqueda, integraciones via webhook y API REST completa, sin límite de usuarios en instalaciones propias.

---

## Funcionalidades Clave para LogiCore Solutions

- **Canales por área**: Ventas, Operaciones, TI, Gerencia — comunicación organizada por equipo
- **Webhooks entrantes**: Recepción de notificaciones de ERPNext, SuiteCRM y Authentik
- **Bots**: Automatización de notificaciones de inventario, alertas de seguridad y reportes
- **Búsqueda en historial**: Búsqueda completa en todos los mensajes y archivos compartidos
- **Aplicación móvil**: iOS y Android disponibles, facilitando comunicación de repartidores en campo
- **Integraciones**: Integración nativa con Jira, GitHub, Grafana y servicios via API REST

---

## Criterios de Evaluación

| Criterio | Calificación | Comentario |
|---|---|---|
| Licencia OSS | ✅ MIT | Team Edition sin costo y sin límites de usuarios |
| Comunidad | ✅ Muy activa | 30,000 estrellas GitHub, releases frecuentes |
| Documentación | ✅ Excelente | Docs detallados para admin y usuarios |
| Curva de aprendizaje | ✅ Baja | Interfaz similar a Slack, adopción rápida |
| Compatibilidad | ✅ Docker / Linux | Imagen oficial y docker-compose disponible |
| Soporte comercial | ✅ Disponible | Mattermost Enterprise con soporte dedicado |

---

## Ventajas

- Interfaz familiar para usuarios que han usado Slack
- Datos 100% en servidores propios de LogiCore
- App móvil para los equipos de campo y repartidores
- Playbooks para gestionar procesos operativos repetitivos
- Webhooks para centralizar notificaciones de todo el ecosistema

## Desventajas

- Videoconferencia requiere integración externa (Jitsi)
- Algunas funciones avanzadas (Playbooks completos, guest accounts) solo en Enterprise
- Requiere servidor con 2GB RAM mínimo

---

## Integración en el Ecosistema LogiCore

```
Mattermost (hub de notificaciones)
   ← ERPNext     (webhook: stock bajo mínimo, facturas vencidas, nuevas órdenes)
   ← SuiteCRM    (webhook: lead asignado, oportunidad cerrada)
   ← Authentik   (webhook: login fallido, nuevo usuario creado)
   → Authentik   (OIDC: SSO para autenticación de usuarios)
```

## Ejemplo de Webhook (ERPNext → Mattermost)

```json
POST https://mattermost.logicore.mx/hooks/WEBHOOK_TOKEN
{
  "channel": "operaciones-alertas",
  "username": "ERPNext Bot",
  "text": "⚠️ **Stock bajo**: Producto *Caja Corrugada 60x40* tiene solo 12 unidades (mínimo: 50). [Ver en ERPNext](https://erpnext.logicore.mx)"
}
```

---

## Referencias

- Documentación oficial: https://docs.mattermost.com
- GitHub: https://github.com/mattermost/mattermost
- Foro comunitario: https://forum.mattermost.com
- App móvil: disponible en App Store y Google Play
