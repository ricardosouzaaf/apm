class LoteController < ApplicationController
  
  def index
  	#@mes = I18n.t Date.today.strftime("%B")
  	@mes = I18n.l(Date.today, format: "%B")
  	@boletos = Boleto.all
  	@clients = Client.all
  	@q = Crediario.where(:printed => false).ransack(params[:q])
  	@carne = @q.result(distinct: true).order(:client_id).paginate(:page => params[:page], :per_page => 12)
  	#@carne = Crediario.order(:client_id)

  end

  def generate
  	
  	#pegando parametro do pai

  	pai = params[:client]

  	puts "Cliente: #{pai}"
  	@cliente = Client.where(:id => params[:client]).first

  	@mes = I18n.l(Date.today, format: "%B")

  	mes_atual = Date.today.strftime('%m')

  	data = Date.today.to_time(:utc)

  	puts data.end_of_year

  	mes_atual = mes_atual.to_i

  	year = Time.now.year




  	while mes_atual != 13 do 

  		puts "O Mês atual é: #{mes_atual}"

  		vencimento = "#{year}-#{mes_atual}-10"
  		vencimento = vencimento.to_date
  		puts "O vencimento sera: #{vencimento}"
  		doc_number = "#{@cliente.registro_aluno}#{mes_atual}"
  		carne = Crediario.new(:client_id => pai, :amount => 35.00, :emission => Date.today, :maturity => vencimento, :doc_number => doc_number, :printed => false, :status => false )

  		puts carne.inspect
  		
  		carne.save
  		mes_atual = mes_atual.to_i + 1	

  	end # final while
  	if carne.save
        
          flash[:success] = "Carnê criado com sucesso!"
          redirect_to :controller => 'lote', :action => 'index'	
       
      end  
  	
  end #final método generate

  def printed
    
    @dados_boleto = Crediario.find(params[:id])
    @boleto = Brcobranca::Boleto::Sicredi.new
    @boleto.cedente = "APM DO ColÉGIO MILITAR "
    @boleto.documento_cedente = "01064671000189"
    @boleto.sacado = @dados_boleto.client.name
    @boleto.sacado_documento = @dados_boleto.client.cpf
    @boleto.avalista = "APM DO COLÉGIO MILITAR"
    @boleto.avalista_documento = "01064671000189"
    @boleto.valor = @dados_boleto.amount
    @boleto.agencia = "0911"
    @boleto.conta_corrente = "05945"
    @boleto.variacao = "19"
    @boleto.byte_idt = "2"
    @boleto.posto = "05"
    @boleto.numero_documento = "10402"
    @boleto.data_vencimento = @dados_boleto.maturity.to_date
    @boleto.data_documento = @dados_boleto.emission.to_date
    @boleto.instrucao1 = "SR. CAIXA, APÓS O VENCIMENTO NAO COBRAR MULTA, JUROS OU MORA."
    @boleto.instrucao2 = "SR. RESPONSÁVEL, O NAO PAGAMENTO DESTE BOLETO IMPLICARÁ A PERDA DO DESCONTO DO VALOR."
    @boleto.instrucao3 = "VENCIMENTO REFERENTE AO ALUNO: #{@dados_boleto.client.student} / Turma: #{@dados_boleto.client.turma}"

    @boleto.sacado_endereco = @dados_boleto.client.address

    headers['Content-Type']='application/pdf'

    send_data @boleto.to(:pdf), :filename => "boleto_#{@dados_boleto.client.student}_#{@dados_boleto.maturity.to_date}.pdf"

    @dados_boleto.update_attributes(:printed => true)

    #redirect_to :controller => "lote", :action => "index"

  end

end
