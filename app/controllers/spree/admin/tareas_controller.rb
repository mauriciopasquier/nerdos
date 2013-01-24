# encoding: utf-8
require 'tareas'
class Spree::Admin::TareasController < Spree::Admin::BaseController
  
  def procesar
    case params[:commit]
      when 'Carga masiva'
        bulk
      else
        redirect_to admin_tareas_path
    end
  end

  private

    def bulk
      dir = Rails.root.join('tmp/imagenes')
      if params[:url]
        Tareas.imaginar_y_producir(params[:url], dir, params[:atributos])
      else
        Tareas.producir(dir, params[:atributos])
      end
      flash.notice = "Carga masiva terminada!!!"
      redirect_to admin_tareas_path
    end
end
