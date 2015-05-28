Rails.application.routes.draw do
  namespace :administracao do
    resources :ambientes
  end

  namespace :administracao do
    resources :situacoes
  end

  namespace :administracao do
    resources :concursos
  end

  namespace :administracao do
    resources :classes
  end

  namespace :administracao do
    resources :quadros
  end

  namespace :administracao do
    resources :cargos
  end

  devise_for :usuarios
  resources :funcionarios

  get 'administracao/listagem_funcionarios'
  get 'administracao/criar_funcionario'
  get 'administracao/editar_funcionario'
  post 'administracao/salvar_funcionario'
  post 'administracao/atualizar_funcionario'
  get 'administracao/detalhes_funcionario'
  get 'administracao/relatorio_quantitativo_professor'
  get 'administracao/relatorio_quantitativo_nao_docente'
  get 'administracao/relatorio_nominal'
  get "administracao/autocomplete_local_nome"
  resources :funcionarios do
    get :autocomplete_local_nome,:on=>:collection
    get :funcionario_professor
  end
  namespace :administracao do 
    resources :disciplinas
    resources :usuarios
    resources :locais
  end

  #get '/', :to => 'administracao#listagem_funcionarios',:constraints => lambda{|req| req.env['warden'].user.try(:editor?)}
  #get '/', :to => 'administracao#listagem_funcionarios',:constraints => lambda{|req| req.env['warden'].user.try(:gestor_seed?)}
  #get '/', :to => 'administracao#listagem_funcionarios',:constraints => lambda{|req| req.env['warden'].user.try(:admin?)}
  root :to => 'funcionarios#index'
end
