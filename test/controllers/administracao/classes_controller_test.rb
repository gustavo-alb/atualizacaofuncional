require 'test_helper'

class Administracao::ClassesControllerTest < ActionController::TestCase
  setup do
    @administracao_classe = administracao_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administracao_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administracao_classe" do
    assert_difference('Administracao::Classe.count') do
      post :create, administracao_classe: { codigo: @administracao_classe.codigo, nome: @administracao_classe.nome }
    end

    assert_redirected_to administracao_classe_path(assigns(:administracao_classe))
  end

  test "should show administracao_classe" do
    get :show, id: @administracao_classe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administracao_classe
    assert_response :success
  end

  test "should update administracao_classe" do
    patch :update, id: @administracao_classe, administracao_classe: { codigo: @administracao_classe.codigo, nome: @administracao_classe.nome }
    assert_redirected_to administracao_classe_path(assigns(:administracao_classe))
  end

  test "should destroy administracao_classe" do
    assert_difference('Administracao::Classe.count', -1) do
      delete :destroy, id: @administracao_classe
    end

    assert_redirected_to administracao_classes_path
  end
end
