class LoteController < ApplicationController
  
  def index
  	#@mes = I18n.t Date.today.strftime("%B")
  	@mes = I18n.l(Date.today, format: "%B")
  	@boletos = Boleto.all
  end

  def generate
  	
  end

end
