require_relative 'entity'

# La siguiente instrucción, con la boquita a la izquierda, indica que
# Organization hereda de la clase Entity. Hereda sus métodos
class Organization < Entity
  # Este atributo attr_accessor es una variable de instancia. Se llama posteriormente
  # con @data
  attr_accessor :data
=begin EJEMPLO DE DATA:
{"login"=>"costarica-g47", "id"=>79238656, "node_id"=>"MDEyOk9yZ2FuaXphdGlvbjc5MjM4NjU2", "url"=>"https://api.github.com/orgs/costarica-g47", "repos_url"=>"https://api.github.com/orgs/costarica-g47/repos", "events_url"=>"https://api.github.com/orgs/costarica-g47/events", "hooks_url"=>"https://api.github.com/orgs/costarica-g47/hooks", "issues_url"=>"https://api.github.com/orgs/costarica-g47/issues", "members_url"=>"https://api.github.com/orgs/costarica-g47/members{/member}", "public_members_url"=>"https://api.github.com/orgs/costarica-g47/public_members{/member}", "avatar_url"=>"https://avatars.githubusercontent.com/u/79238656?v=4", "description"=>nil, "is_verified"=>false, "has_organization_projects"=>true, "has_repository_projects"=>true, "public_repos"=>0, "public_gists"=>0, "followers"=>0, "following"=>0, "html_url"=>"https://github.com/costarica-g47", "created_at"=>"2021-02-18T03:10:35Z", "updated_at"=>"2021-02-18T03:13:46Z", "type"=>"Organization"}
=end

  # Método initialize se llama cuando creo un objeto a partir de
  # Organization.new
  # Se debe crear un objeto a partir de Organization mandando un parámetro
  # data, que es lo que se recibe desde la API
  def initialize(data)
    # Con super llama al método del mismo nombre de la clase que hereda.
    super()
    # Despues de llamar a super, donde inicializa la instancia @utils,
    # que tambien queda disponible para esta clase, pasamos a inicializar la
    # variable de instancia @data.
    @data = data
  end

  # Metodo para escribir una pagina HTML con los datos de esta organización.
  # Primero comprueba que filename tenga la extensión .html, si no la tiene la añade.
  # Luego crea un string que contiene el body, y la pasa al metodo super
  # de la clase entity, el cual añade el head que corresponde.
  def to_html(filename)
    # Aqui se comprueba si la variable filename contiene la extension .html
    # si filaname no contiene .html, se lo agrega al final.
    # Aqui se puede arreglar algo, y es que comprobar *ademas* que filename
    # no solo contenga el string .html, si no que se encuentre al final.
    if not(filename.include? ".html")
      filename = filename + ".html"
    end

    write_to_html = "<h1>ORGANIZACIÓN</h1>" +
      "<table>" +
      "<thead>" +
      "<tr>" +
      "<th>Login</th>" +
      "<th>URL</th>" +
      "<th>Repos url</th>" +
      "<th>Events url</th>" +
      "<th>Members url</th>" +
      "<th>Public members url</th>" +
      "<th>Fecha de creacion</th>" +
      "</tr>" +
      "</thead>" +
      "<tbody>" +
      "<tr>" +
      "<td>#{@data['login']}</td>" +
      "<td>#{@data['url']}</td>" +
      "<td>#{@data['repos_url']}</td>" +
      "<td>#{@data['events_url']}</td>" +
      "<td>#{@data['members_url']}</td>" +
      "<td>#{@data['public_members_url']}</td>" +
      "<td>#{@data['created_at']}</td>" +
      "</tr>" +
      "</tbody>" +
      "</table>"
    super(filename, write_to_html)

  end

  # Este metodo ofrece una serie de opciones al usuario,
  # que le permitirá realizar diversas operaciones con el objeto
  # creado a partir de esta clase.
  def menu
    # Comienza el loop infinito
    begin
      # Muestra el menu
      puts
      puts "==== BIENVENIDO A INTERFAZ ORGANIZATION ===="
      puts
      puts "Seleccione la opcion para ejecutar una acción"
      puts "(1) Escribir HTML"
      puts "(2) Ver datos interesantes"
      puts "(3) Ver todos los datos"
      puts "(q) Para salir"

      # Pide una respuesta al usuario usando gets. Sanitiza el string usando .chomp
      respuesta = gets.chomp
      if respuesta == '1'
        puts
        puts "Ingrese el nombre del archivo. Si no escribe nada el nombre sera organization"
        filename = gets.chomp
        # Operador ternario Checkea si filename es un string vacio con metodo empty?
        # si filename está vacío, envia 'organization' como parametro. Si no, envia el filename
        to_html(filename.empty? ? 'organization' : filename)
      elsif respuesta == '2'
        puts to_s
        puts "\nPresione enter para continuar..."
        respuesta = gets.chomp
      elsif respuesta == '3'
        # FIXME Esto no funciona !!!, se cae en la linea @utils.viewHash(@data)
        @utils.viewHash(@data)
        puts "\nPresione enter para continuar..."
        respuesta = gets.chomp
      end
    end while respuesta != 'q'
  end

  # XXX
  # Este metodo es muy especial. to_s viene de to_string. Y se ocupa
  # para convertir este objeto a un objeto del tipo string.
  # escribiendo este método, usted podrá hacer que cuando se ejecute la instrucción
  # > organization = Organization.new(data)
  # > puts organization
  # entonces con esta ultima: "puts organization", se verá
  # pantalla el string interpolado de acá abajo, y no se verá
  # la dirección de memoria.
  def to_s
    "Login: #{@data['login']}\n" +
    "URL: #{@data['url']}\n" +
    "Repos url: #{@data['repos_url']}\n" +
    "Events url: #{@data['events_url']}\n" +
    "Members url: #{@data['members_url']}" +
    "Public members url: #{@data['public_members_url']}\n" +
    "Fecha de creacion: #{@data['created_at']}\n"
  end
end