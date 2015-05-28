require 'test_helper'

class Administracao::QuadrosControllerTest < ActionController::TestCase
  setup do
    @administracao_quadro = administracao_quadros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administracao_quadros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administracao_quadro" do
    assert_difference('Administracao::Quadro.count') do
      post :create, administracao_quadro: { codigo: @administracao_quadro.codigo, nome: @administracao_quadro.nome }
    end

    assert_redirected_to administracao_quadro_path(assigns(:administracao_quadro))
  end

  test "should show administracao_quadro" do
    get :show, id: @administracao_quadro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administracao_quadro
    assert_response :success
  end

  test "should update administracao_quadro" do
    patch :update, id: @administracao_quadro, administracao_quadro: { codigo: @administracao_quadro.codigo, nome: @administracao_quadro.nome }
    assert_redirected_to administracao_quadro_path(assigns(:administracao_quadro))
  end

  test "should destroy administracao_quadro" do
    assert_difference('Administracao::Quadro.count', -1) do
      delete :destroy, id: @administracao_quadro
    end

    assert_redirected_to administracao_quadros_path
  end
end
