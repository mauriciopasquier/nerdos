# encoding: utf-8

namespace :imagine do

  desc "Genera productos a partir de las imagenes de de /tmp/nerdos/imagenes o dir=directorio"
  task :productos => :environment do
    dir = ENV['dir'] || "/tmp/nerdos/imagenes"
    Dir.glob "#{Rails.root.join dir}/*.png" do |i|
      nombre = File.basename(i, File.extname(i))
      p = Spree::Product.create(name: nombre, price: 80)
      p.images.build(attachment: File.open(i))
      p.sku = nombre
      if ENV['publicar']
        p.available_on = Date.today
      end
      p.save
    end
  end
end
