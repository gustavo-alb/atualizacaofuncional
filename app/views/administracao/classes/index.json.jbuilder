json.array!(@administracao_classes) do |administracao_classe|
  json.extract! administracao_classe, :id, :nome, :codigo
  json.url administracao_classe_url(administracao_classe, format: :json)
end
