class Administracao::ConcursosController < ApplicationController
  before_action :set_administracao_concurso, only: [:show, :edit, :update, :destroy]

  # GET /administracao/concursos
  # GET /administracao/concursos.json
  def index
    @administracao_concursos = Administracao::Concurso.all
  end

  # GET /administracao/concursos/1
  # GET /administracao/concursos/1.json
  def show
  end

  # GET /administracao/concursos/new
  def new
    @administracao_concurso = Administracao::Concurso.new
  end

  # GET /administracao/concursos/1/edit
  def edit
  end

  # POST /administracao/concursos
  # POST /administracao/concursos.json
  def create
    @administracao_concurso = Administracao::Concurso.new(administracao_concurso_params)

    respond_to do |format|
      if @administracao_concurso.save
        format.html { redirect_to @administracao_concurso, notice: 'Concurso was successfully created.' }
        format.json { render :show, status: :created, location: @administracao_concurso }
      else
        format.html { render :new }
        format.json { render json: @administracao_concurso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /administracao/concursos/1
  # PATCH/PUT /administracao/concursos/1.json
  def update
    respond_to do |format|
      if @administracao_concurso.update(administracao_concurso_params)
        format.html { redirect_to @administracao_concurso, notice: 'Concurso was successfully updated.' }
        format.json { render :show, status: :ok, location: @administracao_concurso }
      else
        format.html { render :edit }
        format.json { render json: @administracao_concurso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administracao/concursos/1
  # DELETE /administracao/concursos/1.json
  def destroy
    @administracao_concurso.destroy
    respond_to do |format|
      format.html { redirect_to administracao_concursos_url, notice: 'Concurso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administracao_concurso
      @administracao_concurso = Administracao::Concurso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def administracao_concurso_params
      params.require(:administracao_concurso).permit(:nome, :codigo)
    end
end
