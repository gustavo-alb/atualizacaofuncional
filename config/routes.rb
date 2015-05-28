Rails.application.routes.draw do
  namespace :administracao do
    resources :carga_horarias
  end

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

  get 'gerenciar/listagem_funcionarios'
  get 'gerenciar/criar_funcionario'
  get 'gerenciar/editar_funcionario'
  post 'gerenciar/salvar_funcionario'
  post 'gerenciar/atualizar_funcionario'
  get 'gerenciar/detalhes_funcionario'
  get 'gerenciar/relatorio_quantitativo_professor'
  get 'gerenciar/relatorio_quantitativo_nao_docente'
  get 'gerenciar/relatorio_nominal'
  get 'gerenciar/autocomplete_local_nome'
  resources :funcionarios do
    get :autocomplete_local_nome,:on=>:collection
    get :funcionario_professor
  end
  namespace :administracao do 
    resources :disciplinas
    resources :usuarios do
      get :autocomplete_local_nome,:on=>:collection
    end
    resources :locais
  end

  get '/', :to => 'gerenciar#listagem_funcionarios',:constraints => lambda{|req| req.env['warden'].user.try(:editor?)}
  #get '/', :to => 'gerenciar#listagem_funcionarios',:constraints => lambda{|req| req.env['warden'].user.try(:gestor_seed?)}
  #get '/', :to => 'gerenciar#listagem_funcionarios',:constraints => lambda{|req| req.env['warden'].user.try(:admin?)}
  root :to => 'funcionarios#index'
end
