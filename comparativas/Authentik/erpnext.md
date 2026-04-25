# Ficha Técnica: ERPNext

## Información General

| Campo | Valor |
|---|---|
| **Nombre** | ERPNext |
| **Desarrollador** | Frappe Technologies Pvt. Ltd. |
| **Licencia** | GPL-3.0 |
| **Repositorio** | https://github.com/frappe/erpnext |
| **Sitio oficial** | https://erpnext.com |
| **Último commit** | Abril 2025 |
| **Contribuidores** | 3,200+ |
| **Estrellas GitHub** | 22,000+ |
| **Lenguaje principal** | Python (Frappe Framework) + JavaScript |

---

## Descripción

ERPNext es un sistema de planificación de recursos empresariales (ERP) completamente de código abierto, construido sobre el framework Frappe. Cubre de forma nativa los módulos de contabilidad, inventario, ventas, compras, manufactura, nómina, proyectos, activos fijos y CRM básico.

---

## Módulos Relevantes para LogiCore Solutions

- **Inventario y almacén**: Control de stock, valuación PEPS/UEPS, transferencias entre sucursales (CDMX, Monterrey, Guadalajara)
- **Ventas**: Órdenes de venta, facturas, CFDI para México
- **Compras**: Órdenes de compra, recepción de mercancía, cuentas por pagar
- **Contabilidad**: Plan de cuentas, conciliación bancaria, estados financieros
- **Nómina**: Cálculo de nómina, percepciones, deducciones (con configuración para México)

---

## Criterios de Evaluación

| Criterio | Calificación | Comentario |
|---|---|---|
| Licencia OSS | ✅ GPL-3.0 | Completamente libre, código auditable |
| Comunidad | ✅ Muy activa | Commits diarios, 3,200+ contribuidores |
| Documentación | ✅ Excelente | https://docs.erpnext.com |
| Curva de aprendizaje | ⚠️ Alta | Requiere capacitación para administradores |
| Compatibilidad | ✅ Docker / Linux | Imagen oficial disponible |
| Soporte comercial | ✅ Disponible | Frappe Cloud, partners certificados |

---

## Ventajas

- Cero costo de licenciamiento
- Localización para México (CFDI, IVA, SAT) via Frappe MX
- Framework propio (Frappe) altamente personalizable
- Comunidad hispanohablante activa en Discord y foro oficial
- Historial de proyecto estable desde 2010

## Desventajas

- Curva de aprendizaje pronunciada para el framework Frappe
- Requiere servidor dedicado con al menos 4GB RAM
- Actualizaciones mayores pueden ser complejas

---

## Integración en el Ecosistema LogiCore

```
SuiteCRM --[REST API]--> ERPNext (Órdenes de Venta)
ERPNext  --[Webhook]---> Mattermost (Alertas de inventario)
Authentik --[SAML/OIDC]-> ERPNext (SSO)
```

---

## Referencias

- Documentación oficial: https://docs.erpnext.com
- GitHub: https://github.com/frappe/erpnext
- Frappe School (cursos gratuitos): https://frappe.school
- Comunidad: https://discuss.frappe.io
