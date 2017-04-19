json.array!(@boolios) do |boolio|
  json.extract! boolio, :id
  json.url boolio_url(boolio, format: :json)
end
