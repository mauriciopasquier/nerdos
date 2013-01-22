module Tareas

  def self.imaginar(url, dir)
    dir ||= Rails.root.join('tmp/imagenes')
    system("mkdir -p #{dir}")
    system("cd #{dir};wget -q -m -nd -A png,jpg,jpeg #{url}")
  end

  def self.producir(dir)
    Dir.glob "#{dir}/*.png" do |i|
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

  def self.imaginar_y_producir(url, dir)
    imaginar(url, dir)
    producir(dir)
  end
end
