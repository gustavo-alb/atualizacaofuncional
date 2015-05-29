class Administracao::CargaHorariasController < ApplicationController
  before_action :set_administracao_carga_horaria, only: [:show, :edit, :update, :destroy]

  # GET /administracao/carga_horarias
  # GET /administracao/carga_horarias.json
  def index
    @q = Administracao::CargaHoraria.ransack((params[:q]))
    @carga_horarias = @q.result(distinct: true).order(:nome).paginate(:page=>params[:page],:per_page=>10)
  end

  # GET /administracao/carga_horarias/1
  # GET /administracao/carga_horarias/1.json
  def show
  end

  # GET /administracao/carga_horarias/new
  def new
    @administracao_carga_horaria = Administracao::CargaHoraria.new
  end

  # GET /administracao/carga_horarias/1/edit
  def edit
  end

  # POST /administracao/carga_horarias
  # POST /administracao/carga_horarias.json
  def create
    @administracao_carga_horaria = Administracao::CargaHoraria.new(administracao_carga_horaria_params)

    respond_to do |format|
      if @administracao_carga_horaria.save
        format.html { redirect_to @administracao_carga_horaria, notice: 'Carga horaria was successfully created.' }
        format.json { render :show, status: :created, location: @administracao_carga_horaria }
      else
        format.html { render :new }
        format.json { render json: @administracao_carga_horaria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /administracao/carga_horarias/1
  # PATCH/PUT /administracao/carga_horarias/1.json
  def update
    respond_to do |format|
      if @administracao_carga_horaria.update(administracao_carga_horaria_params)
        format.html { redirect_to @administracao_carga_horaria, notice: 'Carga horaria was successfully updated.' }
        format.json { render :show, status: :ok, location: @administracao_carga_horaria }
      else
        format.html { render :edit }
        format.json { render json: @administracao_carga_horaria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administracao/carga_horarias/1
  # DELETE /administracao/carga_horarias/1.json
  def destroy
    @administracao_carga_horaria.destroy
    respond_to do |format|
      format.html { redirect_to administracao_carga_horarias_url, notice: 'Carga horaria was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administracao_carga_horaria
      @administracao_carga_horaria = Administracao::CargaHoraria.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def administracao_carga_horaria_params
      params.require(:administracao_carga_horaria).permit(:carga_horaria, :nome)
    end
end
