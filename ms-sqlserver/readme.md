# Financiero DB

Este repositorio contiene un backup de la base de datos del financiero junto a un docker-compose y scripts para levantarla.

La motivacion de esto es disponer de una base de datos en un estado conocido y con una calidad de datos cercana a produccion para desarrollo y pruebas.

## Prerequisitos
Como unico requisito es necesario tener Docker instalado y Docker compose (Viene por defecto con Docker Desktop).
Tambien recomendamos que dispongan de SQL Management Studio.

## Ejecutarlo con Docker Compose

Basta con abrir una consola y ejecutar
```
docker-compose up -d
```

Esto levantara una instancia de SQL Server escuchando en el puerto 1401.

Una vez que inicie completamente (unos 2 minutos el primer arranque), correr en una terminal de powershell de windows el script ``restaurar-db.ps1``. Esto restaurara el backup de la base de datos automaticamente.

## Uso con Java

Si se desea usar con Java, la JDBC URL es la siguiente:
```
spring.datasource.url=jdbc:sqlserver://localhost:1401;databaseName=TESTING_MUTUAL
spring.datasource.hikari.username=sa
spring.datasource.hikari.password=EivRv760
```

## Cambio de puerto expuesto

Si se desea cambiar el puerto de escucha solo debe crear un archivo ``.env`` y setear la variable de entorno ``PUERTO_MSSQL`` con el puerto deseado.

Ejemplo:
```
PUERTO_MSSQL=1434
```

## Conexion con SQL Management Studio

Para conectarse con SQL Management Studio como servidor hay que especificar el puerto de la siguiente forma ``localhost,1401`` y utilizar de autenticacion ``SQL Server Authentication`` conectandose con el usuario ``sa`` y password ``EivRv760``

## Compilar la imagen
```
docker build . -t pabloeivsoftware/financiero-db-testing
```

```
docker push pabloeivsoftware/financiero-db-testing:latest   
```