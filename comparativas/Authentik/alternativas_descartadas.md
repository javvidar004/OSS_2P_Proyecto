# Herramientas Evaluadas y No Seleccionadas

Este documento registra las herramientas OSS evaluadas que no fueron seleccionadas como parte del ecosistema final, con la justificación técnica de cada decisión.

---

## Área 1: ERP — Alternativas a ERPNext

### Odoo Community (LGPL-3.0)
- **Por qué no fue seleccionado**: Aunque Odoo tiene la comunidad más grande del grupo evaluado (5,000+ contribuidores), su modelo de negocio es freemium. Los módulos más relevantes para LogiCore (e-commerce, firma electrónica, soporte avanzado de manufactura) requieren la licencia Odoo Enterprise, cuyo costo puede superar los $800,000 MXN/año para 100 usuarios. ERPNext ofrece equivalentes funcionales sin costo adicional.

### Dolibarr (GPL-3.0)
- **Por qué no fue seleccionado**: Dolibarr es una herramienta adecuada para microempresas (1-20 colaboradores), pero su arquitectura monolítica y limitada capacidad de personalización lo hacen inadecuado para las necesidades de LogiCore con 100 empleados y tres sucursales. La comunidad (280 contribuidores) es significativamente más pequeña.

### Metasfresh (GPL-2.0)
- **Por qué no fue seleccionado**: Metasfresh está orientado principalmente a manufactura y distribución alemana, con documentación escasa en español y una comunidad pequeña (90 contribuidores). El riesgo de abandono es mayor y la curva de aprendizaje es la más alta del grupo evaluado.

---

## Área 2: CRM — Alternativas a SuiteCRM

### CiviCRM (AGPL-3.0)
- **Por qué no fue seleccionado**: CiviCRM está diseñado específicamente para organizaciones sin fines de lucro, asociaciones y ONGs. Sus módulos de recaudación de fondos, membresías y voluntariado no aportan valor a LogiCore. Además, requiere WordPress o Drupal como base, añadiendo complejidad infraestructural.

### EspoCRM (GPL-3.0)
- **Por qué no fue seleccionado**: EspoCRM es una opción sólida con buena UX y curva de aprendizaje baja, sin embargo, sus capacidades de reportes y módulo de ventas son menos maduros que los de SuiteCRM. Para LogiCore, el módulo AOR (Advanced Open Reports) de SuiteCRM es un diferenciador clave.

### Vtiger CRM OSS (VTPL 1.1)
- **Por qué no fue seleccionado**: La licencia VTPL (Vtiger Public License) es menos estándar y tiene restricciones que dificultan la modificación para uso comercial. Además, el desarrollo de la versión OSS ha desacelerado significativamente, con menos commits que las alternativas.

---

## Área 3: IAM — Alternativas a Authentik

### Keycloak (Apache 2.0)
- **Por qué no fue seleccionado**: Keycloak es la herramienta más madura del grupo (1,800+ contribuidores, respaldada por Red Hat). Sin embargo, su consola de administración tiene una curva de aprendizaje significativamente más alta que Authentik. Para un equipo de TI pequeño como el de LogiCore, la facilidad de administración de Authentik es determinante. Keycloak sería la recomendación si LogiCore escalara a 500+ usuarios o requiriera federación de identidades compleja.

### Authelia (Apache 2.0)
- **Por qué no fue seleccionado**: Authelia es excelente como proxy de autenticación (2FA para aplicaciones sin SSO nativo), pero no es un Identity Provider completo. No soporta SAML de forma nativa y su gestión de usuarios es más básica. En el ecosistema de LogiCore, Authentik cubre tanto el rol de IdP como el de proxy.

### Kanidm (MPL-2.0)
- **Por qué no fue seleccionado**: Kanidm es un proyecto prometedor escrito en Rust con foco en seguridad, pero es relativamente nuevo (120 contribuidores) y su documentación aún está en desarrollo. El riesgo de adopción temprana es alto para un entorno productivo.

---

## Área 4: Comunicación — Alternativas a Mattermost

### Rocket.Chat (MIT)
- **Por qué no fue seleccionado**: Rocket.Chat es la alternativa más cercana a Mattermost y ambas son opciones válidas. La decisión a favor de Mattermost se basó en su mayor simplicidad administrativa, menor consumo de recursos (Go vs Node.js) y su mejor integración documentada con OAuth2/OIDC para SSO. Rocket.Chat sería igualmente válido si LogiCore requiriera videollamadas integradas nativas.

### Zulip (Apache 2.0)
- **Por qué no fue seleccionado**: Zulip tiene un modelo de conversación único (hilos organizados por tema dentro de canales) que requiere un cambio de mentalidad significativo para equipos acostumbrados a WhatsApp. La adopción por parte de los 100 colaboradores de LogiCore sería más lenta.

### Element / Matrix (Apache 2.0)
- **Por qué no fue seleccionado**: El protocolo Matrix ofrece federación descentralizada (comunicarse con usuarios de otros servidores Matrix), una característica que LogiCore no necesita. La complejidad de administrar un servidor Synapse, combinada con la curva de aprendizaje de Element, supera los beneficios para el caso de uso de LogiCore.
