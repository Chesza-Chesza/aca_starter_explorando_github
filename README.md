# Introducción

Este es un proyecto para explorar la API pública de github.

El proyecto se enfoca en comenzar por explorar una organización. Primero
se hace el llamado a la API para obtener los datos de la organización: los
repositorios públicos que tiene, los miembros, el nombre de login, etc.

Los datos entonces se guardan y luego se usan para hacer más llamados
a otros endpoints de la API de github, y con eso se puede mostrar
la información por pantalla a través del terminal, como también
escribir un HTML con los datos.

La gracia de este proyecto, es que es un proyecto que interactúa con el
usuario: no se trata de un script que simplemente ejecuta instrucciones,
como hemos visto hasta ahora. Si no que este proyecto muestra distintos
menúes al usuario, y le pregunta por las acciones que quiere ejecutar.

El objetivo de este proyecto es de demostrar la utilidad de la programación
orientada a objetos para modelar las organizaciones y los miembros. De como
se puede ocupar una clase para delegar tareas como hacer consultas a una API.

# Estructura

Este proyecto se conforma de varios archivos.

- `main.rb`: es el que se debe ejecutar con el comando siguiente:

> ruby main.rb

Este es el punto de entrada, o `entrypoint` en inglés. Corriendo este programa
se corre toda la aplicación. Este archivo contiene una clase que se llama
`Main`. Esta clase contiene un método `loop` que es el loop principal de la
aplicación. Se le dice `loop principal` pues es una parte del programa que va
a presentar el menú principal de la aplicación en un bucle hasta que el
usuario decida terminar.

- `utils.rb`: Contiene una clase `Utils` que implementa varios métodos de
propósito general. Como por ejemplo para ver el contenido de un array, o
ver el contenido de un hash.

- `entity.rb`: Este archivo contiene una clase `Entity`, muy similar a la
clase `Utils`, ya que por si sola no sirve de mucho, si no que está
creada para que se use como _base_ en otras clases. Entity implementa un
método llamado `to_html`, el cual recibe como parámetro un nombre de archivo
(`filename`) y un string con contenido HTML (`html_string`). Lo que hace el
método es abrir un archivo con el nombre de `filename`, escribir la base
HTML para que contenga Bootstrap y otras cosas dentro del HEAD, y dentro del
BODY mete lo que viene en `html_string`. Pero la mejor manera de ocupar
este método, es que lo herede otra clase.

- `organization.rb`: Este contiene una clase `Organization` que modela una organización en
github. Esta clase está completa y CASI sin errores.
Sirve para ilustrar como operar una clase, y qué tipo de cosas
se pueden hacer. Esta clase hereda de la clase `Entity`, definida en el
archivo `entity.rb`.

- `member.rb`: Este contiene una clase `Member` que modela un miembro de la organización.

# Tareas

## General

- Estudie el programa completo: Vea la clase `Main` en `main.rb`, vea como
funciona el loop, y qué es lo que pasa con la respuesta recibida por parte
del usuario. Vea como se crea el objeto a partir de la clase `Organization`.
Utilice `puts` para ver en el terminal las cosas que le parezca extraña.
- Estudie la clase `Organization`, esa está completa. Revísela bien. Estudie
como se llama al método `super`, ¿Qué pasa si le pone un `puts`, por ejemplo,
al método `initialize` de la clase `Entity`? Qué pasa cuando se crea un nuevo
objeto de clase `Organization`? Intente predecir lo que va a pasar antes de
ejecutar el código.
- Toda entidad nueva debe ir dentro de una clase.
- ¡NO OLVIDE PONER LOS require_relative !

## Member
- Member: Crear un reporte. Haga un método en la clase `Member` para que
genere un archivo html que contenga un reporte de ese usuario. Haga que
se vea bonito, u ordenado. SUGERENCIA: Haga uso del método `to_html` de
la clase padre para crear el HTML

- Complete la clase Members con lo que se pide en ese mismo archivo

## Repo

- En la clase Main, hay un método que llama a la clase API y muestra los datos del repositorio en particular:
  ensayo_git_cr_bootstrap. Adaptelo para que pueda sacar los datos de cualquier otro repositorio.

- Haga una clase Repo, que permita realizar tareas interesantes sobre un repositorio.
  Use la clase `Entity` como base para facilitarle la creación del HTML. Entre las
  tareas interesantes que puede hacer están:
    - Mostrar las estrellas que tiene el repositorio
    - Mostrar los colaboradores que tiene el repositorio
    - Mostrar los forks que tiene el repositorio.

