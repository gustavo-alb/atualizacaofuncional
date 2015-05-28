require 'test_helper'

class Administracao::CargaHorariasControllerTest < ActionController::TestCase
  setup do
    @administracao_carga_horaria = administracao_carga_horarias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administracao_carga_horarias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administracao_carga_horaria" do
    assert_difference('Administracao::CargaHoraria.count') do
      post :create, administracao_carga_horaria: { carga_horaria: @administracao_carga_horaria.carga_horaria, nome: @administracao_carga_horaria.nome }
    end

    assert_redirected_to administracao_carga_horaria_path(assigns(:administracao_carga_horaria))
  end

  test "should show administracao_carga_horaria" do
    get :show, id: @administracao_carga_horaria
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administracao_carga_horaria
    assert_response :success
  end

  test "should update administracao_carga_horaria" do
    patch :update, id: @administracao_carga_horaria, administracao_carga_horaria: { carga_horaria: @administracao_carga_horaria.carga_horaria, nome: @administracao_carga_horaria.nome }
    assert_redirected_to administracao_carga_horaria_path(assigns(:administracao_carga_horaria))
  end

  test "should destroy administracao_carga_horaria" do
    assert_difference('Administracao::CargaHoraria.count', -1) do
      delete :destroy, id: @administracao_carga_horaria
    end

    assert_redirected_to administracao_carga_horarias_path
  end
end
