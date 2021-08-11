# AWS Client ChangeSG
Estos scripts escritos tanto en BATCH como en BASH, permiten cambiar el Security Group (SG) asociado a una instancia EC2. Dicha instancia puede estar tanto activa como apagada.

La idea es permitir, de forma remota y a través del cliente CLI AWS, cambiar los distintos SG creados en la consola AWS para restringir los accesos a los distintos servicios de la máquina EC2.

Lo que conseguiremos es aplicar el principio de "mínima exposición" para conseguir una capa adicional de seguridad en nuestras máquinas EC2 expuestas en Internet.

A modo de ejemplo, en el script de BASH he modificado el código para poder recibir el tipo de "modo" y así poder crear una tarea programada que permita cambiar el SG en función de una fecha (CRONTAB), etc.

# REQUISITOS PREVIOS
* 1 - Para el uso de los scripts, deberemos crear a través de la herramienta AWS Identity and Access Management (IAM) existente en la consola de administración AWS, tanto un usuario con "Programmatic access" para obtener tanto el "access key ID" como el "secret access key".
* 2 - Una vez creado el usuario, debermos asignarle una política con los permisos necesarios. En nuestro caso necesitamos el "ec2:ModifyInstanceAttribute" para poder realizar los cambios en el atributo SG de la instancia. Como ejemplo:
```
    {
    "Version": "2021-08-22",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "ec2:ModifyInstanceAttribute",
            "Resource": [
                "arn:aws:ec2:*:XXX:security-group/*",
                "arn:aws:ec2:eu-west-3:XXX:instance/INSTANCEID"
            ]
        }
    ]
}
```
* 3 - Crear los SG que necesitemos.
* 4 - Instalar el cliente AWS en el equipo. Se puede descargar desde la propia Web de Amazon AWS (https://aws.amazon.com/es/cli/).
* 5 - Ejecutar "aws configure" para indicar tanto el "Access Key ID" como el "Secret Access Key" obtenidos en el punto 1. 

# USO:
WINDOWS:

          c:\users\wllop\change_sg_aws.bat

LINUX | MAC:

          /home/wllop/chage_sg_aws.sh

# EJEMPLO DEL BATCH:
* Tenemos una aplicación Web de gestión de clientes y un servicio SSH para la configuración del servidor. Lo que pretedemos es que:
  * 1 - En condiciones "normales" sólo se permita el acceso a los puertos http/80 y https/443 --> SecurityGroup1
  * 2 - Si necesitamos acceso al servicio SSH, permitimos el acceso a los puertos http/80, https/443 y ssh/22 --> SecurityGroup2
  * 3 - Puesto que la aplicación Web no será utilizada en determinadas "franjas horarias", queremos impedir el acceso a cualquiera de los puertos del servidor, bloqueando cualquier intento de conexión --> SecurityGroup3
  
# MEJORAS:
* Obtener un listado de las instancias y de los SG. Para que el propio BAT/SH pueda mostrar las opciones tanto de Instancia como de SG.


Cualquier comentario, error o mejora enviadlo a wllop@esat.es. 

Muchas gracias!!

@wllop