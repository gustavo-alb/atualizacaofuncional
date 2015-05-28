require 'test_helper'

class Administracao::AmbientesControllerTest < ActionController::TestCase
  setup do
    @administracao_ambiente = administracao_ambientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administracao_ambientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administracao_ambiente" do
    assert_difference('Administracao::Ambiente.count') do
      post :create, administracao_ambiente: { codigo: @administracao_ambiente.codigo, nome: @administracao_ambiente.nome }
    end

    assert_redirected_to administracao_ambiente_path(assigns(:administracao_ambiente))
  end

  test "should show administracao_ambiente" do
    get :show, id: @administracao_ambiente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administracao_ambiente
    assert_response :success
  end

  test "should update administracao_ambiente" do
    patch :update, id: @administracao_ambiente, administracao_ambiente: { codigo: @administracao_ambiente.codigo, nome: @administracao_ambiente.nome }
    assert_redirected_to administracao_ambiente_path(assigns(:administracao_ambiente))
  end

  test "should destroy administracao_ambiente" do
    assert_difference('Administracao::Ambiente.count', -1) do
      delete :destroy, id: @administracao_ambiente
    end

    assert_redirected_to administracao_ambientes_path
  end
end
