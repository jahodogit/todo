# Todo app

Hola,  en este proyecto decidi usar DDD como arquitectura de la solucion ya que permite una mejor mantenibilidad y evolucion del codigo. Esta arquitectura esta reperesentada en los paquetes de domain, infrastructure y el root/lib del proyecto como capa de presentacion.

Siguiendo las recomendaciones de solid e implementando algunos patrones de diseños como inversion de dependencias, repositorios, AAA, dto y anticorrupcion.

Para la capa de presentacion se implemento el patron BLoC para aislar la logica de la aplicacion de la UI y se uso Cubit como manejador de estados. 

Nota: Desafortunadamente no cuento en este momento con un equipo Mac para la configuracion del proyecto para iOS,  sin embargo se siguieron las recomendaciones de firebase para el uso de la libreria desde iOS. 


## Funcionalidades

    - Creacion de actividades
    - Traducccion de actividades a idioma ingles
    - Cambio de estado de las actividades Abierta / Terminanda
    - Eliminacion de activiades

## Detalle de las librerias usadas:

    - Inversion de dependencias:  GetIt+Injectable
    - Persistencia de datos:      Cloud firestore
    - Manejador de estados:       flutter_bloc / Cubit


