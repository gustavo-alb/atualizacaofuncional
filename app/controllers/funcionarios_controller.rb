class FuncionariosController < ApplicationController
  before_action :set_funcionario, only: [:show, :edit, :update, :destroy]
  before_action :mudar_senha,:dados
  autocomplete :local, :nome, full: true,:class_name=>Administracao::Local

  # GET /funcionarios
  # GET /funcionarios.json
  def index
    @funcionarios = Funcionario.where(:lotacao_id=>current_usuario.lotacao_id)
  end

  # GET /funcionarios/1
  # GET /funcionarios/1.json
  def show
  end

  # GET /funcionarios/new
  def new
    @funcionario = Funcionario.new
  end

  # GET /funcionarios/1/edit
  def edit
  end

  # POST /funcionarios
  # POST /funcionarios.json
  def create
    @funcionario = Funcionario.new(funcionario_params)

    respond_to do |format|
      if @funcionario.save!
        format.html { redirect_to @funcionario, notice: 'Funcionário Cadastrado com Sucesso.' }
        format.json { render :show, status: :created, location: @funcionario }
      else
        format.html { render :new }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcionarios/1
  # PATCH/PUT /funcionarios/1.json
  def update
    respond_to do |format|
      if @funcionario.update(funcionario_params)
        format.html { redirect_to @funcionario, notice: 'Funcionário Atualizado com Sucesso.' }
        format.json { render :show, status: :ok, location: @funcionario }
      else
        format.html { render :edit }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionarios/1
  # DELETE /funcionarios/1.json
  def destroy
    @funcionario.destroy
    respond_to do |format|
      format.html { redirect_to funcionarios_url, alert: 'Funcionário Apagado com Sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcionario
      @funcionario = Funcionario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funcionario_params
      #params.require(:funcionario).permit(:nome, :cpf, :cadastro, :componente_curricular, :documento_movimentacao, :carga_horaria_id, :classe_id, :cargo_id, :lotacao_id, :quadro_id, :concurso_id, :municipio_opcao_id, :situacao_id, :usuario_id, :disciplina_concurso_id, :disciplina_atuacao_id)
      params.require(:funcionario).permit!
    end
end
