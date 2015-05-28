json.array!(@administracao_cargos) do |administracao_cargo|
  json.extract! administracao_cargo, :id, :nome, :codigo
  json.url administracao_cargo_url(administracao_cargo, format: :json)
end
