require_relative 'api'
require_relative 'utils'
require_relative 'member'
require_relative 'organization'

URL_COSTA_RICA_ORG = "https://api.github.com/orgs/costarica-g47"

=begin
TODO list:
- Agregar un método "activity", para listar los usuarios en orden. Primero el que tenga más repositorios, y por último el que tenga menos repositorios
- Agregar un método "mostRated", que busque de entre todos los repositorios de cada usuario, y muestre el repositorio que tenga más estrellitas
- Crear un reporte en un archivo HTML con los datos de todos los usuarios que tengan su perfil público.

PARA CRANEAR:
- Si va a hacer el reporte HTML de todos los usuarios, ¿Dónde tendría que implementar la parte que escribe el HTML? En qué clase?
En la clase Member? O en la clase Main? O debiera hacer una nueva clase para manejar exclusivamente un array de Member? O hay que buscar una clase
ya existente en la librería de Ruby para hacer eso? Vale la pena hacer una clase nueva para esto?

INVESTIGACIÓN
- La interfaz se ve un poco aburrida. ¿Qué librerías existen para ver la información en terminal más clara? Existe algo que me permita colocar
colores en el terminal? Qué tal poner una animación?

=end

class Main
  attr_accessor :utils, :api
  attr_accessor :members

  def initialize
    @utils = Utils.new
    @api = Api.new
    @members = []
  end

  def loop
    begin
      puts
      puts "==== BIENVENIDO A INTERFAZ GITHUB ===="
      puts
      puts "Seleccione la opcion para ejecutar una acción"
      puts "(1) Ver organizacion Costa Rica G47"
      puts "(2) Ver miembros organización Costa Rica G47"
      puts "(3) TODO Listar los miembros en orden de quien tiene más repositorios"
      puts "(4) TODO De entre todos los usuarios, buscar el repositorio que tenga más estrellas "
      puts "(5) Ver detalles de un repo en particular"
      puts "(q) Para salir"
      respuesta = gets.chomp
      if respuesta == '1'
        organizacion
      elsif respuesta == '2'
        getMiembros
      elsif respuesta == '3'
        activity
      elsif respuesta == '4'
        mostRated
      elsif respuesta == '5'
        repo
      end
    end while respuesta != 'q'
  end

  def repo
    puts " ______________________________________ "
    puts " /                                    \\ "
    puts "/        PARCHIALMENTE HECHO           \\"
    puts "|                                      |"
    puts "|  Este metodo debe cambiarlo un poco. |"
    puts "|                                      |"
    puts "|    Presione enter para continuar     |"
    puts "|                                      |"
    gets.chomp
    # TODO: Aquí está pidiendo la información de un repositorio
    #       al objeto @api. Esto le va a traer siempre la información del
    #       mismo repositorio. Un poco aburrido, ¿no? Modifíquelo para que:
    #       1. Pida al usuario un nombre de repositorio, y con ese nombre de repositorio
    #       lo descargue. Puede probarlo con algún repositorio suyo, o con el TalentsDirectory
    #       2. Haga una clase Repo para que modele esa respuesta de la API, y
    #          haga operaciones relacionadas con el repo: ver los colaboradores, las estrellas (stargazers), etc
    #
    # PARA CRANEAR
    #       1. ¿Le funciona con el puro nombre de repositorio, o no? Necesita más información? Puede ser el nombre del dueño?
    #       2. No conozco más repositorios aparte de los míos :(. Los nombres que encuentro son muy complicados y me equivoco. ¿No sería
    #          útil poder tomar una lista de repositorios y mostrarlos acá, para así yo escoger un repositorio de la lista?
    #          De dónde puedo sacar la lista? Donde encontrar esa lista? Como implementarlo?
    response = @api.requestRepo
    @utils.viewHash response
    puts
    puts "Presione enter para continuar"
    gets

  end

  def showTodo
    puts " ______________________________________ "
    puts " /                                    \\ "
    puts "/                TODO                  \\"
    puts "|                                      |"
    puts "|  Este metodo debe implementarlo ud.  |"
    puts "|                                      |"
    puts "|    Presione enter para continuar     |"
    puts "|                                      |"
    gets.chomp
  end

  def mostRated
    # TODO: Debe buscar todos los repositorios de cada usuario, y escoger el repositorio
    # que tenga más estrellas, y mostrarlo acá.
    # Para mostrarlo, puede imprimirlo por pantalla,
    # o puede escribir un archivo HTML, como quiera.
    # Sugerencia: Para solucionar esto, primero implemente en la clase
    # `Member` un método para contar todos los repositorios que tiene un usuario
    showTodo
  end

  def activity
    # TODO: Debe listar todos los usuarios por orden de actividad.
    # Para mostrarlo, puede imprimirlo por pantalla,
    # o puede escribir un archivo HTML, como quiera.
    # Sugerencia: Para solucionar esto, primero implemente en la clase
    # `Member` un método para contar todos los repositorios que tiene un usuario
    showTodo
  end

  def organizacion
    # TODO: Convertir la respuesta en un objeto de clase Organization
    response = @api.requestCostaRicaG47
    @organization = Organization.new(response)
    puts ">>>>> Data organización:\n"
    # @utils.viewHash(response)
    puts @organization
    puts "\nPresione enter para ingresar al menu de la organizacion\n"
    gets

    @organization.menu
  end

  def getMiembros
    # El código acá está mutilado. Para solucionar el problema, debe modificar la línea que está marcada al final de la instrucción con
    # el tag XXX
    # Las tareas que se piden en este método se pueden resolver con una línea de código.
    # Recuerde que el bloque do |iterador| end se puede escribir también así: {|iterador|}
    # Igual lo puede resolver en más de una línea, pero la solución óptima se hace en una sola línea
    response = @api.requestCostaRicaG47Members
    # TODO: Convertir cada hash de la respuesta en un objeto de clase Member. Modifique la siguiente instruccion, 2 lineas más abajo
    # HINT: Fíjese bien en qué tipo de respuesta devuelve el metodo requestCostaRicaG47Members, parece un array, ¿o no?
    @members = response # XXX <------------- modificar acá

    # TODO: En la siguiente linea hay mucha información, cambiela para que muestre *solamente* el nombre del usuario
    @utils.viewArray(response) # XXX <---------- modificar acá

    puts
    puts "Arriba puede ver los miembros obtenidos"
    puts
    puts "Ingrese el nombre de un miembro para ver mas detalles"
    puts
    nombre_usuario = gets.chomp
    # TODO: Ocupar la variable respuesta para filtrar el arreglo de @members por el nombre_usuario que ingresó el usuario.
    # HINT: Si ocupa .filter, tenga cuidado con el valor de retorno. Se pide un miembro y no un arreglo.
    member = @members[0] # XXX <----------------- modificar acá
    puts member
    puts
    puts ">>> Presione enter para continuar"
    gets
    puts "Continuando..."
    # PARA CRANEAR: A veces es muy largo el nombre de usuario, y uno puede cometer errores. ¿Cómo se puede hacer
    # para que el programa sea más robusto? Cómo se puede hacer para pedirle al usuario el número de la lista
    # y sacar el usuario así? Mejora lo suficientemente la experiencia de usuario para implementarlo? Hay alguna alternativa mejor?
  end
end

main = Main.new
main.loop
