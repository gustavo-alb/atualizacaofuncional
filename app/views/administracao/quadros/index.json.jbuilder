json.array!(@administracao_quadros) do |administracao_quadro|
  json.extract! administracao_quadro, :id, :nome, :codigo
  json.url administracao_quadro_url(administracao_quadro, format: :json)
end
