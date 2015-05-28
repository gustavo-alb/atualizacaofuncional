require 'test_helper'

class Administracao::ConcursosControllerTest < ActionController::TestCase
  setup do
    @administracao_concurso = administracao_concursos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administracao_concursos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administracao_concurso" do
    assert_difference('Administracao::Concurso.count') do
      post :create, administracao_concurso: { codigo: @administracao_concurso.codigo, nome: @administracao_concurso.nome }
    end

    assert_redirected_to administracao_concurso_path(assigns(:administracao_concurso))
  end

  test "should show administracao_concurso" do
    get :show, id: @administracao_concurso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administracao_concurso
    assert_response :success
  end

  test "should update administracao_concurso" do
    patch :update, id: @administracao_concurso, administracao_concurso: { codigo: @administracao_concurso.codigo, nome: @administracao_concurso.nome }
    assert_redirected_to administracao_concurso_path(assigns(:administracao_concurso))
  end

  test "should destroy administracao_concurso" do
    assert_difference('Administracao::Concurso.count', -1) do
      delete :destroy, id: @administracao_concurso
    end

    assert_redirected_to administracao_concursos_path
  end
end
