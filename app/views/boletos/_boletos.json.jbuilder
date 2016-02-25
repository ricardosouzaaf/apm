json.boletos(@boletos) do |boleto|
  json.extract! boleto, :id, :amount, :doc_number ,:discount, :date, :maturity
  json.client boleto.client.name
  json.url boleto_url(boleto, format: :json)
end
