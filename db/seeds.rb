# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Carga las semillas por default para Argentina
Rake::Task['db:load_dir'].reenable
Rake::Task['db:load_dir'].invoke File.join(File.dirname(__FILE__), 'semillas', 'default')

Spree::Zone.find(:all).each do |zone|
  Spree::Zone.update_counters zone.id, :zone_members_count => zone.zone_members.length
end

# Carga roles y usuario administrador
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

# Carga semillas específicas para nerdos. Se pueden cargar de otro directorio
# llamando así:
#   dir=directorio rake db:seed
unless ENV['dir'].present?
  ENV['dir'] = 'semillas/nerdos'
end
Rake::Task['db:data:load_dir'].invoke
