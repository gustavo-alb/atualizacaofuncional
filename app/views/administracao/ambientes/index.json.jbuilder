json.array!(@administracao_ambientes) do |administracao_ambiente|
  json.extract! administracao_ambiente, :id, :nome, :codigo
  json.url administracao_ambiente_url(administracao_ambiente, format: :json)
end
