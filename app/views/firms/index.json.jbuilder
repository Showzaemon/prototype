json.array!(@firms) do |firm|
  json.extract! firm, :id, :name, :step, :stock
  json.url firm_url(firm, format: :json)
end
