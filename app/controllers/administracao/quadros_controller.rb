class Administracao::QuadrosController < ApplicationController
  before_action :set_administracao_quadro, only: [:show, :edit, :update, :destroy]

  # GET /administracao/quadros
  # GET /administracao/quadros.json
  def index
    @administracao_quadros = Administracao::Quadro.all
  end

  # GET /administracao/quadros/1
  # GET /administracao/quadros/1.json
  def show
  end

  # GET /administracao/quadros/new
  def new
    @administracao_quadro = Administracao::Quadro.new
  end

  # GET /administracao/quadros/1/edit
  def edit
  end

  # POST /administracao/quadros
  # POST /administracao/quadros.json
  def create
    @administracao_quadro = Administracao::Quadro.new(administracao_quadro_params)

    respond_to do |format|
      if @administracao_quadro.save
        format.html { redirect_to @administracao_quadro, notice: 'Quadro was successfully created.' }
        format.json { render :show, status: :created, location: @administracao_quadro }
      else
        format.html { render :new }
        format.json { render json: @administracao_quadro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /administracao/quadros/1
  # PATCH/PUT /administracao/quadros/1.json
  def update
    respond_to do |format|
      if @administracao_quadro.update(administracao_quadro_params)
        format.html { redirect_to @administracao_quadro, notice: 'Quadro was successfully updated.' }
        format.json { render :show, status: :ok, location: @administracao_quadro }
      else
        format.html { render :edit }
        format.json { render json: @administracao_quadro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administracao/quadros/1
  # DELETE /administracao/quadros/1.json
  def destroy
    @administracao_quadro.destroy
    respond_to do |format|
      format.html { redirect_to administracao_quadros_url, notice: 'Quadro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administracao_quadro
      @administracao_quadro = Administracao::Quadro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def administracao_quadro_params
      params.require(:administracao_quadro).permit(:nome, :codigo)
    end
end
