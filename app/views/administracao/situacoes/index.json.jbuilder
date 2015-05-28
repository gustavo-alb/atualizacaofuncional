json.array!(@administracao_situacoes) do |administracao_situacao|
  json.extract! administracao_situacao, :id, :nome, :codigo
  json.url administracao_situacao_url(administracao_situacao, format: :json)
end
