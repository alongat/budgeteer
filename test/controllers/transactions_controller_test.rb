# typed: false
require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mtransaction = transactions(:one)
  end

  test "should get index" do
    get mmtransactions_url
    assert_response :success
  end

  test "should get new" do
    get new_mtransaction_url
    assert_response :success
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post mmtransactions_url, params: {mtransaction: {  } }
    end

    assert_redirected_to mtransaction_url(Mtransaction.last)
  end

  test "should show transaction" do
    get mtransaction_url(@mtransaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_mtransaction_url(@mtransaction)
    assert_response :success
  end

  test "should update transaction" do
    patch mtransaction_url(@mtransaction), params: {mtransaction: {  } }
    assert_redirected_to mtransaction_url(@mtransaction)
  end

  test "should destroy transaction" do
    assert_difference('Transaction.count', -1) do
      delete mtransaction_url(@mtransaction)
    end

    assert_redirected_to mmtransactions_url
  end
end
