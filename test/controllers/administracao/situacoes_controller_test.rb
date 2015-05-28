require 'test_helper'

class Administracao::SituacoesControllerTest < ActionController::TestCase
  setup do
    @administracao_situacao = administracao_situacoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administracao_situacoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administracao_situacao" do
    assert_difference('Administracao::Situacao.count') do
      post :create, administracao_situacao: { codigo: @administracao_situacao.codigo, nome: @administracao_situacao.nome }
    end

    assert_redirected_to administracao_situacao_path(assigns(:administracao_situacao))
  end

  test "should show administracao_situacao" do
    get :show, id: @administracao_situacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administracao_situacao
    assert_response :success
  end

  test "should update administracao_situacao" do
    patch :update, id: @administracao_situacao, administracao_situacao: { codigo: @administracao_situacao.codigo, nome: @administracao_situacao.nome }
    assert_redirected_to administracao_situacao_path(assigns(:administracao_situacao))
  end

  test "should destroy administracao_situacao" do
    assert_difference('Administracao::Situacao.count', -1) do
      delete :destroy, id: @administracao_situacao
    end

    assert_redirected_to administracao_situacoes_path
  end
end
