=begin
TODO List:
- Complete el método to_html para generar un reporte en un archivo HTML de este usuario.
Los datos que quiera agregar son libres: Escoja los que más apropiados le parezcan para hacer
un reporte de ese usuario sobre su perfil en github.
=end
class Member
  attr_accessor :data
  def initialize(data)
    if data.class == Hash
      @data = data
    else
      raise StandardError.new "ERROR: El Member solo se puede construir con un hash como parámetro"
    end
  end

  def login
    @data['login']
  end

  def username
    @data['login']
  end

  # TODO Crear método que reciba un nombre de archivo, y genere un HTML a partir de las propiedades relevantes del member
  def to_html
  end

  # XXX Convierte este objeto a un string, para que -entre otras cosas- se pueda ver bonito con un puts
  def to_s
    "login: #{@data["login"]}\n" +
    "username: #{@data["login"]}\n" +
    "avatar_url: #{@data["avatar_url"]}\n" +
    "url: #{@data["url"]}\n" +
    "starred_url: #{@data["starred_url"]}\n" +
    "repos_url: #{@data["repos_url"]}\n"
  end
end