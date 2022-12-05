# Aplicación de pasaje del repositorio de vecinos de elasticsearch a mysql (basado en codegniter 4)

## Requerimientos

PHP >= 7.4 con las siguientes extensiones

- [libcurl](http://php.net/manual/en/curl.requirements.php)

Adicionalmente:

- json
- [mbstring](http://php.net/manual/en/mbstring.installation.php)
- [mysqlnd](http://php.net/manual/en/mysqlnd.install.php)
- composer (para la instalación de los paquetes remotos)

MySQL >= 5.6

## Instalación

### Descarga desde el repositorio

En principio estamos alojando el repositorio en github, pero el objetivo final es hacerlo en un gitlab "on premise" en MVL, con lo que lo único que cambiaría sería la URL del mismo.

**git clone https://github.com/lblum/elastic-mysql.git**
**git checkout develop**

En nuestro repositorio siempre vamos a tener 2 ramas

- **main**    -> Producción, o sea la rama ya probada en QA
- **develop** -> Rama de desarrollo

Trataremos de notificar los cambios vía mail y/o *pull request*.

Dentro de lo posible, usaremos la metodología **GIT flow**.

### Instalación de los paquetes

**composer install**

Con esto se instalan los paquetes adicionales

- framework codeigniter 4
- elasticsearch/elasticsearch 

### Creación de la base de datos

La creación de la base de datos consta de 2 etapas

#### Creación de la base de datos propiamente dicha y el usuario dueño de la misma

Como ejemplo ponemos
- Nombre de la base de datos : **buv**
- Nombre del usuario dueño : **buv_owner**
- Password del usuario dueño : **buv_owner**

Desde la línea de comandos de mysql como usuario administrador (root):

```
#
# Creación de la base de datos con el set de caractere default
# 
CREATE DATABASE buv;
#
# Creación del usuario dueño de la base
#
CREATE USER 'buv_owner'@'%' IDENTIFIED BY 'buv_owner';
#
# Asignación de privilegios
#
GRANT ALL PRIVILEGES ON buv.* TO 'buv_owner'@'%';
FLUSH PRIVILEGES;
```

#### Creación de las tablas de la base de datos

Para esto, usaremos los mecanismos de migración del codeigniter 4

Desde el root de la instalación:

**php spark migrate**

Esto va a tomar las indicaciones que estén en la carpeta *app\Database\Migrations*, y las va a ir ejecutando.
Va a crear 3 tablas

- **migrations** -> Marca en que migración estamos (puede haber muchas)
- **load_data_errors** -> Indica posibles errores en un proceso de carga de datos
- **buv_data** -> Los datos propiamente dichos

### Configuración

Toda la configuración está en el archivo .env, el cual no se sube al repositorio git.
Para tenerlo, copiar el archivo *env* en *.env* y editar los valores

```
CI_ENVIRONMENT = development  # development/production

#--------------------------------------------------------------------
# DATABASE
#--------------------------------------------------------------------

database.default.hostname = localhost
database.default.database = 'buv'
database.default.username = 'buv-owner'
database.default.password = 'buv-owner'
database.default.DBDriver = MySQLi
database.default.port = 3306

#--------------------------------------------------------------------
# LOGGER
#--------------------------------------------------------------------

logger.threshold = 4  # Crea un archivo de log en writable\logs. El threshold 4 indica solo errores

#--------------------------------------------------------------------
# CURLRequest
#--------------------------------------------------------------------

curlrequest.shareOptions = true

#--------------------------------------------------------------------
# Parámetros propios de BUV
# (En app\Config\BUV.PHP)
#--------------------------------------------------------------------
buv.elasticSearchProt  = 'https'         # Protocolo de elasticsearch
buv.elasticSearchHost  = 'localhost'     # Host de elasticsearch
buv.elasticSearchPort  = 9200            # Puerto de elasticsearch  
buv.elasticSearchUser  = 'elastic'       # Usuario de elasticsearch  
buv.elasticSearchPass  = '***********'   # Password del usuario de elasticsearch
buv.elasticSearchIndex = 'vecinos'       # Nombre del índice donde están los datos
buv.elasticSearchPage  = 1000            # Tamaño de la página de búsqueda (performance)
```
## Uso

Atención: Esto no borra las tablas, sino que agrega al final

La manera mas rápida de borrar las tablas es ejecutar 

**php spark migrate:refresh**

Esto hace un "drop" de las tablas y las crea de vuelta.

Una vez creada y configurada la base de datos y la aplicación, desde el root se invoca

**php spark load-data**

Esto va a ir mostrando
```
02/12/2022 02:17:59.598 Conectando al elasticsearch
02/12/2022 02:17:59.622 Comenzando el query
02/12/2022 02:18:00.462 Procesando un total de 250.365 registros
[########..]  81% Complete
```
Una vez finalizado:

```
02/12/2022 02:21:34.306 Proceso de importación finalizado
+-----------------------+---------+
| Registros OK          | 250.365 |
| Registros con errores | 0       |
| Total                 | 250.365 |
+-----------------------+---------+
```

# Aclaraciones de campos

## Tipos de datos
En el índice de elasticsearch **todos** los campos están marcados como text (string), pero en la base de datos hay algunos campos que los asumí como fechas.
Por otro lado, **todos** los campos están puestos como null (excepto los id)

## Campos id
En la tabla hay 2 campos id
- Un numérico autoincremental propio de mysql (id)
- El campo _id original de elasticsearch (un hash)

## Campos adicionales
Las tablas cuentan con campos de *created_at* para marcar cuando fue insertado el registro, y la tabla **buv_data** cuenta con un campo *updated_at* para marcar cuando fue actualizada
