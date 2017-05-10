require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: { client_id: @item.client_id, contract_expiry_date: @item.contract_expiry_date, contract_number: @item.contract_number, depth: @item.depth, height: @item.height, place: @item.place, receipt_date: @item.receipt_date, stack_id: @item.stack_id, weight: @item.weight, width: @item.width }
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    patch :update, id: @item, item: { client_id: @item.client_id, contract_expiry_date: @item.contract_expiry_date, contract_number: @item.contract_number, depth: @item.depth, height: @item.height, place: @item.place, receipt_date: @item.receipt_date, stack_id: @item.stack_id, weight: @item.weight, width: @item.width }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end
