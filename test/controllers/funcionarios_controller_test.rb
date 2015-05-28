require 'test_helper'

class FuncionariosControllerTest < ActionController::TestCase
  setup do
    @funcionario = funcionarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:funcionarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create funcionario" do
    assert_difference('Funcionario.count') do
      post :create, funcionario: { cadastro: @funcionario.cadastro, carga_horaria: @funcionario.carga_horaria, cargo_id: @funcionario.cargo_id, classe_id: @funcionario.classe_id, componente_curricular: @funcionario.componente_curricular, concurso_id: @funcionario.concurso_id, cpf: @funcionario.cpf, disciplina_atuacao_id: @funcionario.disciplina_atuacao_id, disciplina_concurso_id: @funcionario.disciplina_concurso_id, documento_movimentacao: @funcionario.documento_movimentacao, lotacao_id: @funcionario.lotacao_id, municipio_opcao_id: @funcionario.municipio_opcao_id, nome: @funcionario.nome, quadro_id: @funcionario.quadro_id, situacao_id: @funcionario.situacao_id, usuario_id: @funcionario.usuario_id }
    end

    assert_redirected_to funcionario_path(assigns(:funcionario))
  end

  test "should show funcionario" do
    get :show, id: @funcionario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @funcionario
    assert_response :success
  end

  test "should update funcionario" do
    patch :update, id: @funcionario, funcionario: { cadastro: @funcionario.cadastro, carga_horaria: @funcionario.carga_horaria, cargo_id: @funcionario.cargo_id, classe_id: @funcionario.classe_id, componente_curricular: @funcionario.componente_curricular, concurso_id: @funcionario.concurso_id, cpf: @funcionario.cpf, disciplina_atuacao_id: @funcionario.disciplina_atuacao_id, disciplina_concurso_id: @funcionario.disciplina_concurso_id, documento_movimentacao: @funcionario.documento_movimentacao, lotacao_id: @funcionario.lotacao_id, municipio_opcao_id: @funcionario.municipio_opcao_id, nome: @funcionario.nome, quadro_id: @funcionario.quadro_id, situacao_id: @funcionario.situacao_id, usuario_id: @funcionario.usuario_id }
    assert_redirected_to funcionario_path(assigns(:funcionario))
  end

  test "should destroy funcionario" do
    assert_difference('Funcionario.count', -1) do
      delete :destroy, id: @funcionario
    end

    assert_redirected_to funcionarios_path
  end
end
