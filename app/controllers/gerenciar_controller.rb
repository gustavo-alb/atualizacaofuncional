class GerenciarController < ApplicationController
  before_action :dados,:mudar_senha,:admin
  autocomplete :local, :nome, full: true,:class_name=>Administracao::Local
 # def get_autocomplete_items(parameters)
  #  searchterm = params[:term]
  #  items = Administracao::Local.where("nome ilike ? and tipo = ?",searchterm,1)
 # end

  def listagem_funcionarios
    if current_usuario.editor?
      @q = Funcionario.where(:usuario=>current_usuario).ransack(params[:q])
    else
      @q = Funcionario.ransack(params[:q])
    end
    @q.sorts = "nome asc" if @q.sorts.empty?
    @funcionarios = @q.result(distinct: true).order(:nome).paginate(:page=>params[:page],:per_page=>10)
  end

  def relatorio_quantitativo_professor
   @disciplinas = Disciplina.order(:nome)
   respond_to do |format|
    format.pdf { 
      send_data render_to_string, filename: 'foo.pdf', type: 'application/pdf', disposition: 'attachment'
    }
  end
end

def relatorio_quantitativo_nao_docente
 @funcionarios = Funcionario.where(:cargo.ne=>"Professor")
 respond_to do |format|
  format.pdf { 
    send_data render_to_string, filename: 'foo.pdf', type: 'application/pdf', disposition: 'attachment'
  }
end
end

def relatorio_nominal
end

def criar_funcionario
  @funcionario = Funcionario.new
  @titulo = "Cadastrar Funcionário"
  @caminho = gerenciar_salvar_funcionario_path
  render "editor"
end

def editar_funcionario
  @funcionario = Funcionario.find(params[:funcionario_id])
  @titulo = "Editar Funcionário"
  @caminho = gerenciar_atualizar_funcionario_path(:funcionario_id=>params[:funcionario_id])
  render "editor"
end

def salvar_funcionario
 @funcionario = Funcionario.new(funcionario_params)
 @titulo = "Cadastrar Funcionário"
 @caminho = gerenciar_salvar_funcionario_path
 respond_to do |format|
  if @funcionario.save
    format.html { redirect_to gerenciar_detalhes_funcionario_path(:funcionario_id=>@funcionario), notice: 'Funcionário cadastrado com sucesso' }
    format.json { render :show, status: :created, location: @funcionario }
  else
    format.html { render :editor }
    format.json { render json: @funcionario.errors, status: :unprocessable_entity }
  end
end
end

def atualizar_funcionario
  @funcionario = Funcionario.find(params[:funcionario_id])
  titulo = "Editar Funcionário"
  @caminho = gerenciar_atualizar_funcionario_path(:funcionario_id=>params[:funcionario_id])
  respond_to do |format|
    if @funcionario.update(funcionario_params)
      format.html { redirect_to gerenciar_detalhes_funcionario_path(:funcionario_id=>@funcionario.id), notice: 'Funcionário atualizado.' }
      format.json { render :show, status: :ok, location: @funcionario }
    else
      format.html { render :edit,:alert=>"Erros no cadastro, favor checar" }
      format.json { render json: @funcionario.errors, status: :unprocessable_entity }
    end
  end
end

def detalhes_funcionario
  @funcionario = Funcionario.find(params[:funcionario_id])
end

def funcionario_params
  params.require(:funcionario).permit([:lotacao_id,:documento,:usuario_id,:componente_curricular,:nome, :cpf, :cadastro, :classe_id, :padrao_id, :turmas, :carga_horaria_id, :ambiente_id,:ambiente_nao_docente, :formacao, :ch_em_sala, :cargo, :quadro, :concurso, :area_concurso, :programa, :situacao, :local_id, :disciplina_concurso_id, :disciplina_atuacao_id, :municipio_concurso_id])
end

end