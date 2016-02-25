class LoteController < ApplicationController
  
  def index
  	#@mes = I18n.t Date.today.strftime("%B")
  	@mes = I18n.l(Date.today, format: "%B")
  	@boletos = Boleto.all
  	@clients = Client.all

  end

  def generate
  	 @clients = Client.all

  	 @clients.each do |client|


  	 	puts client.name


  	 end


  end

end
