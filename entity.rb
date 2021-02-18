require_relative 'utils'
class Entity
  attr_accessor :utils

  def initialize()
    @utils = Utils.new
  end

  def to_html(filename, html_string)
    File.open(filename,'w') do |file|
      file.puts '<html>'
      file.puts '  <head>'
      file.puts '    <meta charset="UTF-8">'
      file.puts '    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">'
      file.puts '    <meta name="author" content="Academia Desafio Latam Costa Rica G47">'
      file.puts '    <meta name="description" content="Resultado de estudio POO">'
      file.puts '    <title>RESULTADO ESTUDIO POO</title>'
      file.puts '    <!-- Bootstrap CSS 4.6.0 VERSION-->'
      file.puts '    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">'
      file.puts '    <!-- Google Fonts -->'
      file.puts '    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap" rel="stylesheet">'
      file.puts '  </head>'
      file.puts '  <body>'
      file.puts html_string
      file.puts '  </body>'
      file.puts '</html>'
    end
  end
end