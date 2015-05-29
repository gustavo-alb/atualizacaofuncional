class Administracao::AmbientesController < ApplicationController
  before_action :set_administracao_ambiente, only: [:show, :edit, :update, :destroy]

  # GET /administracao/ambientes
  # GET /administracao/ambientes.json
  def index
    @q = Administracao::Ambiente.ransack((params[:q]))
    @ambientes = @q.result(distinct: true).order(:nome).paginate(:page=>params[:page],:per_page=>10)
  end

  # GET /administracao/ambientes/1
  # GET /administracao/ambientes/1.json
  def show
  end

  # GET /administracao/ambientes/new
  def new
    @administracao_ambiente = Administracao::Ambiente.new
  end

  # GET /administracao/ambientes/1/edit
  def edit
  end

  # POST /administracao/ambientes
  # POST /administracao/ambientes.json
  def create
    @administracao_ambiente = Administracao::Ambiente.new(administracao_ambiente_params)

    respond_to do |format|
      if @administracao_ambiente.save
        format.html { redirect_to @administracao_ambiente, notice: 'Ambiente was successfully created.' }
        format.json { render :show, status: :created, location: @administracao_ambiente }
      else
        format.html { render :new }
        format.json { render json: @administracao_ambiente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /administracao/ambientes/1
  # PATCH/PUT /administracao/ambientes/1.json
  def update
    respond_to do |format|
      if @administracao_ambiente.update(administracao_ambiente_params)
        format.html { redirect_to @administracao_ambiente, notice: 'Ambiente was successfully updated.' }
        format.json { render :show, status: :ok, location: @administracao_ambiente }
      else
        format.html { render :edit }
        format.json { render json: @administracao_ambiente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administracao/ambientes/1
  # DELETE /administracao/ambientes/1.json
  def destroy
    @administracao_ambiente.destroy
    respond_to do |format|
      format.html { redirect_to administracao_ambientes_url, notice: 'Ambiente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administracao_ambiente
      @administracao_ambiente = Administracao::Ambiente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def administracao_ambiente_params
      params.require(:administracao_ambiente).permit(:nome, :codigo)
    end
end
