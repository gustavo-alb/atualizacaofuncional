class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_usuario!
  before_action :configure_permitted_parameters, if: :devise_controller?

   def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:local_nome,:gestor_setorial,:editor,:login,:cpf, :email, :nome, :admin, :mudar_senha, :inep, :local_id,:current_password,:password,:password_confirmation,:gestor_seed) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :inep, :cpf, :password, :remember_me) }
  end

  def mudar_senha
    if current_usuario.mudar_senha?
      redirect_to(edit_usuario_registration_path,:notice=>"Mude sua senha, para evitar problemas posteriormente.")
    end
  end
  def dados
    @locais = Administracao::Local.order(:nome).collect{|l|[l.nome,l.id]}
    @cargos = Administracao::Cargo.order(:nome).collect{|c|[c.nome,c.id]}
    @classes = Administracao::Classe.order(:nome).collect{|c|[c.nome,c.id]}
    @quadros = Administracao::Quadro.order(:nome).collect{|q|[q.nome,q.id]}
    @concursos = Administracao::Concurso.order(:nome).collect{|q|[q.nome,q.id]}
    @cargas_horarias = Funcionario.carga_horarias.collect{|c|[c[0].gsub("-"," ").titleize,c[0]]}
    @municipios = Municipio.order(:nome).collect{|q|[q.nome,q.id]}
    @situacoes = Administracao::Situacao.order(:nome).collect{|q|[q.nome,q.id]}
    @disciplinas = Administracao::Disciplina.order(:nome).collect{|q|[q.nome,q.id]}
  end
end
