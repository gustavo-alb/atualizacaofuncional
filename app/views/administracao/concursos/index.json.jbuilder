json.array!(@administracao_concursos) do |administracao_concurso|
  json.extract! administracao_concurso, :id, :nome, :codigo
  json.url administracao_concurso_url(administracao_concurso, format: :json)
end
