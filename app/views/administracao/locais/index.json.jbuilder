json.array!(@locals) do |local|
  json.extract! local, :id, :nome, :codigo, :tipo, :local_pai_id, :municipio_id
  json.url local_url(local, format: :json)
end
