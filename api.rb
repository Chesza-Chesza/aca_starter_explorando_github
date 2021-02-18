require 'uri'
require 'net/http'
require 'json'

# TODO
# Completar el metodo para tomar los datos de un usuario

class Api
  def request(url_target)
    url = URI(url_target)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    return JSON.parse(http.request(request).read_body)
  end

  def requestCostaRicaG47
    url = URI("https://api.github.com/orgs/costarica-g47")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    return JSON.parse(http.request(request).read_body)
  end

  def requestCostaRicaG47Members
    url = URI("https://api.github.com/orgs/costarica-g47/public_members")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    return JSON.parse(http.request(request).read_body)
  end

  def requestRepo
    # TODO Modificar este metodo para que pueda llamar a cualquier otro repositorio
    # HINT: Usted puede ocupar parámetros acá! Debe implementarlo. Recuerde al oso POLAR para modificar el string
    # https://github.com/KarlHeitmann/ensayo_git_cr_bootstrap
    # url = URI("https://api.github.com/repos/octocat/hello-world")
    url = URI("https://api.github.com/repos/KarlHeitmann/ensayo_git_cr_bootstrap")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    return JSON.parse(http.request(request).read_body)
  end
end