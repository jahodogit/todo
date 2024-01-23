# todo

Hola,  ente proyecto decidi usar DDD como arquitectura de la solucion ya que permite una mejora mantenibilidad y evolucion del codigo. Esta arquitectura esta reperesentada en los paquetes de domain, infrastructure y el root/lib del proyecto como capa de presentacion.

Siguiendo las recomendaciones de solid e implementando algunos patrones de diseños como inversion de dependencias, repositorios, AAA, dto y anticorrupcion.

Para la capa de presentacion se implemento el patron BLoC para aislar la logica de la aplicacion de la UI y se uso Cubit como manejador de estados. 

Nota: Desafortunadamente no cuento en este momento con un equipo Mac para la configuracion del proyecot pas iOS,  sin embargo se siguieron las recomendaciones de firebase para el uso de la libreria desde iOS. 

## Getting Started

Detalle de las librerias usadas:

Inversion de dependencias:  GetIt+Injectable
Persistencia de datos:      Cloud firestore
Manejador de estados:       flutter_bloc / Cubit


