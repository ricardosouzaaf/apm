require 'test_helper'

class CrediariosControllerTest < ActionController::TestCase
  setup do
    @crediario = crediarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crediarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crediario" do
    assert_difference('Crediario.count') do
      post :create, crediario: { amount: @crediario.amount, client_id: @crediario.client_id, doc_number: @crediario.doc_number, emission: @crediario.emission, maturity: @crediario.maturity, printed: @crediario.printed, status: @crediario.status }
    end

    assert_redirected_to crediario_path(assigns(:crediario))
  end

  test "should show crediario" do
    get :show, id: @crediario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crediario
    assert_response :success
  end

  test "should update crediario" do
    patch :update, id: @crediario, crediario: { amount: @crediario.amount, client_id: @crediario.client_id, doc_number: @crediario.doc_number, emission: @crediario.emission, maturity: @crediario.maturity, printed: @crediario.printed, status: @crediario.status }
    assert_redirected_to crediario_path(assigns(:crediario))
  end

  test "should destroy crediario" do
    assert_difference('Crediario.count', -1) do
      delete :destroy, id: @crediario
    end

    assert_redirected_to crediarios_path
  end
end
