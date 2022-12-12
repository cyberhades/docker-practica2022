# Práctica Docker 2022

En la siguiente práctica se pide que se que complete el fichero docker-compose.yml.

Como se puede observar, dicho fichero tiene definido dos servicios (app y redis). El servicio `redis` no necesita ningún tipo de modificación, el que hay que completar es el servicio `app`, en el cual queremos lo siguiente:

* Cuando ejecutemos docker-compose up, que podamos acceder a al a aplicación a través del puerto 8080.
* Para que el servicio `app` funcione, tenemos que definir una variable de entorno llamada `DB` con el valor correcto para que `app` se comunique correctamente con `redis`.
* Para que dicha comunicación ocurra, tenemos que asegurarnos que ambos servicios usen la misma red.


### Comprobación

Para comprobar que nuestro servicio `app` funciona como se espera, se pueden ejecutar los siguientes pasos:

    docker-compose up -d (o sin la opción -d)

Abrir el navegador e ir a: [`http://localhost:8080`](http://localhost:8080) y refescar la página varias veces y comprobar que el contador se incremente.

O ejecutar el comando `curl` repetidas veces y ver cómo el contador de visitas se va incrementando:

    $ curl localhost:8080
    Número de visitas: 1

    $ curl localhost:8080
    Número de visitas: 2

    $ curl localhost:8080
    Número de visitas: 3


A veces cuando se hacen cambios, éstos no se ven reflejados por el uso de la caché en Docker. Para limpiar la caché de este ejercicio, podemos destruir los contenedores y volúmenes creado por `docker-compose` con el siguiente comando:

    docker-compose down -v

Y a la hora de levantar nuestros servicios, se puede añadir la opción `--build`:

    docker-composa up --build

Aunque en nuestro caso, esta opción no debería hacernos falta, ya que no se deben hacer cambios en el fichero  `app.py` o `requirements.txt`.