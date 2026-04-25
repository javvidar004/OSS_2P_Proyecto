# Instalación de Gibbon en Windows

> **⚠️ ADVERTENCIA**
> Este método de instalación es únicamente para pruebas locales y evaluación.
> - Las credenciales de base de datos por defecto son inseguras.
> - No utilizar esta configuración en entornos escolares en producción.
> - Para despliegues reales, configura credenciales seguras y usa un stack de servidor de producción.

---

## Requisitos previos

### 1. Instalar XAMPP

XAMPP provee Apache, PHP y MySQL necesarios para ejecutar Gibbon.

1. Ve a la página de XAMPP y descarga el instalador para Windows.
2. Haz doble clic en el instalador de tu carpeta de Descargas y sigue los pasos.

> **ℹ️ INFO:** Si aparece una advertencia sobre software antivirus que puede interferir con la instalación, haz clic en **Yes** para continuar.

> **ℹ️ INFO:** Si aparece un mensaje sobre el Control de Cuentas de Usuario (UAC) de Windows, haz clic en **OK** y evita instalar XAMPP en `C:\Program Files`.

3. Al finalizar la instalación, marca la casilla para abrir el Panel de Control de XAMPP y haz clic en **Finish**.

---

## Configurar Apache

Algunas extensiones de PHP requeridas por Gibbon no están habilitadas por defecto en XAMPP.

1. En el Panel de Control de XAMPP, haz clic en **Config** y selecciona **PHP (php.ini)** para abrir el archivo en el Bloc de notas.
2. Busca las siguientes líneas y elimina el punto y coma (`;`) al inicio de cada una:

```ini
;extension=zip
;extension=gd
;extension=intl
```

Deben quedar así:

```ini
extension=zip
extension=gd
extension=intl
```

3. Guarda el archivo `php.ini` y cierra el Bloc de notas.

---

## Iniciar servicios de XAMPP

1. En el Panel de Control de XAMPP, haz clic en **Start** para **Apache**.

> **ℹ️ INFO:** Si el Firewall de Windows pregunta por acceso de red, haz clic en **Allow**.

2. Haz clic en **Start** para **MySQL**.

> **ℹ️ INFO:** Si el Firewall de Windows pregunta por acceso de red para `mysqld`, haz clic en **Allow**.

3. Verifica que puedes ver la página de bienvenida de XAMPP abriendo en tu navegador:

```
http://localhost/dashboard
```

---

## Configurar MySQL

Establece una contraseña para el usuario root de MySQL.

1. Haz clic en **Shell** en el Panel de Control de XAMPP para abrir una ventana de comandos.
2. Ejecuta el siguiente comando para conectarte a MySQL:

```bash
mysql -u root -p
```

> **ℹ️ INFO:** Presiona **Enter** cuando se te pida la contraseña (el usuario root no tiene contraseña por defecto).

3. Ejecuta el siguiente comando para establecer la contraseña del usuario root:

```sql
alter user 'root'@'localhost' identified by 'root';
```

---

## Crear la base de datos

Configura una base de datos para Gibbon usando phpMyAdmin.

1. En el Panel de Control de XAMPP, haz clic en el botón **Admin** de MySQL.
2. Tu navegador abrirá `http://localhost/phpmyadmin/` en una nueva pestaña.
3. Haz clic en la pestaña **Databases**.
4. Escribe `gibbon` como nombre de la nueva base de datos y haz clic en **Create**.

---

## Crear el directorio web

Crea una carpeta para los archivos de Gibbon.

1. Haz clic en **Shell** en el Panel de Control de XAMPP.
2. Ejecuta el siguiente comando:

```bash
mkdir htdocs\gibbon
```

3. Verifica que la carpeta fue creada:

```bash
dir htdocs
```

---

## Descargar Gibbon

1. Ve a la página de descargas de Gibbon y descarga la última versión.
2. Haz clic derecho en `GibbonEduCore-InstallBundle.zip` en tu carpeta de Descargas, selecciona **Extract All...** y haz clic en **Extract**.
3. Copia el contenido de la carpeta `GibbonEduCore-InstallBundle` a `htdocs\gibbon`. Puedes hacerlo desde el explorador de archivos o con el siguiente comando (reemplaza `<tu-usuario>` con tu nombre de usuario de Windows):

```bash
copy c:\Users\<tu-usuario>\Downloads\GibbonEduCore-InstallBundle\* c:\xampp\htdocs\gibbon\
```

---

## Instalar Gibbon

1. Abre en tu navegador: `http://localhost/gibbon`
2. El instalador de Gibbon verificará los requisitos del sistema. Haz clic en **Submit**.
3. Ingresa la configuración de la base de datos:

| Campo | Valor |
|---|---|
| Database Server | `localhost` |
| Database Name | `gibbon` |
| Username | `root` |
| Password | `root` |

4. Establece **Install demo data** en `Yes` y haz clic en **Submit**.
5. Para finalizar la instalación completa los siguientes campos:
   - Apellido, nombre, correo electrónico, usuario y contraseña del administrador
   - Deja **System Settings** con los valores por defecto
   - Proporciona el nombre e iniciales de la organización
   - En la sección **Miscellaneous**, selecciona país, moneda y zona horaria
6. Haz clic en **Submit** para continuar.

---

## Verificar la instalación

1. Ve a la página de inicio de sesión de Gibbon: `http://localhost/gibbon`
2. Inicia sesión con la cuenta de administrador que creaste.
