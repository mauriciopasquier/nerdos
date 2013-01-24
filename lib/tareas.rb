module Tareas

  def self.imaginar(url, dir)
    dir ||= Rails.root.join('tmp/imagenes')
    system("mkdir -p #{dir}")
    system("cd #{dir};wget -q -m -nd -A png,jpg,jpeg #{url}")
  end

  def self.producir(dir, atributos = {})
    Dir.glob "#{dir}/*.png" do |i|
      nombre = File.basename(i, File.extname(i))

      if atributos[:borrar]
        Spree::Product.find_by_name(nombre).destroy
      end

      p = Spree::Product.find_or_create_by_name(nombre) do |p|
        p.price = atributos[:precio] || 80
      end

      p.images.build(attachment: File.open(i))
      p.sku = nombre

      if atributos[:publicar]
        p.available_on = Date.today
      end

      p.save
    end
  end

  def self.imaginar_y_producir(url, dir, atributos)
    imaginar(url, dir)
    producir(dir, atributos)
  end
end
