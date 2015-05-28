json.array!(@administracao_carga_horarias) do |administracao_carga_horaria|
  json.extract! administracao_carga_horaria, :id, :carga_horaria, :nome
  json.url administracao_carga_horaria_url(administracao_carga_horaria, format: :json)
end
