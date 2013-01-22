# encoding: utf-8
require 'tareas'

namespace :nerdos do

  desc "Descarga las imágenes de los productos de una URL específica"
  task :imaginar => :environment do
    unless ENV['url']
      raise ArgumentError, 'Necesitamos una url con las imágenes (dir=http://algunaurl.com.ar)'
    else
      url = ENV['url']
    end
    Tareas.imaginar(url)
  end

  desc "Genera productos a partir de las imagenes de tmp/imagenes o dir=directorio"
  task :producir => :environment do
    dir = ENV['dir'] || "#{Rails.root.join('tmp/imagenes')}"
    Tareas.producir(dir)
  end

end
