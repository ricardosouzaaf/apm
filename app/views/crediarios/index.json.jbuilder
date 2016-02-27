json.array!(@crediarios) do |crediario|
  json.extract! crediario, :id, :client_id, :amount, :emission, :maturity, :doc_number, :printed, :status
  json.url crediario_url(crediario, format: :json)
end
