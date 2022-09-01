# Documentacion FEL 

# SGC

El SGC es una base de datos Oracle on-premise, contiene practicamente todos los datos de la empresa, las tablas mas importantes para FEL son:

- RECIBOS_CERTIFICACION
- EPHT_PETICION
- EPHT_PETICION_DOCUMENTO
- EPHT_PETICION_RESPUESTA_CERTF

Mas informacion en [Oracle](./DB/Oracle/README.md)  

# Demonios de FEL

Estos demonios son los encargados de procesar los datos del SGC, y generar los archivos XML para mandar a certificar. Existen 4 demonios:

- [Demonio SGC](https://github.com/Gerenciatienerguate/DemonioCertificadorSGC)

- [Demonio Expedientes](https://github.com/Gerenciatienerguate/FEL_DEMONIO_EXPEDIENTES)

- [Demonio Notas](https://github.com/Gerenciatienerguate/FEL_DEMONIO_NOTAS)

- [Servicio Emisor](https://github.com/Gerenciatienerguate/FEL_SERVICIO_EMISOR)

Residen en un servidor Windows on-premise, su ejecucion esta controlada por el Task Scheduler y los scripts de la carpeta [BATS](./BATS)

# Servicios de FEL en AWS

## DynamoDB

Base de datos NoSQL, que se usa para almacenar los datos de la certificacion. Se puede usar para buscar registors puntuales rapidamente, mas no debe usarse para sacar reportes extensos. Si se necesita reportes extensos, se debe usar una base de datos RDS.

Mas informacion en [DynamoDB](./DB/Dynamo/README.md#tablas)

## RDS
Base de datos MySQL, que se usa para llevar una copia en paralelo de la base de datos DynamoDB. Tambien se usa para sacar reportes o depurar datos. Esta es accesible desde la nube y la red interna de la empresa.

Mas informacion en [RDS](./DB/Rds/README.md#tablas)

## ECS

En este servicio se ejecuta [FEL API](), el cual es el punto de entrada del sistema de certificacion. Este hace usos de las algunas funciones Lamda para sus operaciones.
Tambien es altamente escalable y el trafico esta configurado con un balanceador de carga.

## Funciones Lambda 


### 

