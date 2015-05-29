class Administracao::SituacoesController < ApplicationController
  before_action :set_administracao_situacao, only: [:show, :edit, :update, :destroy]

  # GET /administracao/situacoes
  # GET /administracao/situacoes.json
 def index
    @q = Administracao::SituacoesController.ransack((params[:q]))
    @locais = @q.result(distinct: true).order(:nome).paginate(:page=>params[:page],:per_page=>10)
  end

  # GET /administracao/situacoes/1
  # GET /administracao/situacoes/1.json
  def show
  end

  # GET /administracao/situacoes/new
  def new
    @administracao_situacao = Administracao::Situacao.new
  end

  # GET /administracao/situacoes/1/edit
  def edit
  end

  # POST /administracao/situacoes
  # POST /administracao/situacoes.json
  def create
    @administracao_situacao = Administracao::Situacao.new(administracao_situacao_params)

    respond_to do |format|
      if @administracao_situacao.save
        format.html { redirect_to @administracao_situacao, notice: 'Situacao was successfully created.' }
        format.json { render :show, status: :created, location: @administracao_situacao }
      else
        format.html { render :new }
        format.json { render json: @administracao_situacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /administracao/situacoes/1
  # PATCH/PUT /administracao/situacoes/1.json
  def update
    respond_to do |format|
      if @administracao_situacao.update(administracao_situacao_params)
        format.html { redirect_to @administracao_situacao, notice: 'Situacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @administracao_situacao }
      else
        format.html { render :edit }
        format.json { render json: @administracao_situacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administracao/situacoes/1
  # DELETE /administracao/situacoes/1.json
  def destroy
    @administracao_situacao.destroy
    respond_to do |format|
      format.html { redirect_to administracao_situacoes_url, notice: 'Situacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administracao_situacao
      @administracao_situacao = Administracao::Situacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def administracao_situacao_params
      params.require(:administracao_situacao).permit(:nome, :codigo)
    end
end
