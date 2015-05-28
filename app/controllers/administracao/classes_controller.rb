class Administracao::ClassesController < ApplicationController
  before_action :set_administracao_classe, only: [:show, :edit, :update, :destroy]

  # GET /administracao/classes
  # GET /administracao/classes.json
  def index
    @administracao_classes = Administracao::Classe.all
  end

  # GET /administracao/classes/1
  # GET /administracao/classes/1.json
  def show
  end

  # GET /administracao/classes/new
  def new
    @administracao_classe = Administracao::Classe.new
  end

  # GET /administracao/classes/1/edit
  def edit
  end

  # POST /administracao/classes
  # POST /administracao/classes.json
  def create
    @administracao_classe = Administracao::Classe.new(administracao_classe_params)

    respond_to do |format|
      if @administracao_classe.save
        format.html { redirect_to @administracao_classe, notice: 'Classe was successfully created.' }
        format.json { render :show, status: :created, location: @administracao_classe }
      else
        format.html { render :new }
        format.json { render json: @administracao_classe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /administracao/classes/1
  # PATCH/PUT /administracao/classes/1.json
  def update
    respond_to do |format|
      if @administracao_classe.update(administracao_classe_params)
        format.html { redirect_to @administracao_classe, notice: 'Classe was successfully updated.' }
        format.json { render :show, status: :ok, location: @administracao_classe }
      else
        format.html { render :edit }
        format.json { render json: @administracao_classe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administracao/classes/1
  # DELETE /administracao/classes/1.json
  def destroy
    @administracao_classe.destroy
    respond_to do |format|
      format.html { redirect_to administracao_classes_url, notice: 'Classe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administracao_classe
      @administracao_classe = Administracao::Classe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def administracao_classe_params
      params.require(:administracao_classe).permit(:nome, :codigo)
    end
end
