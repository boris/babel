require 'test_helper'

class BorrowControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get borrow_index_url
    assert_response :success
  end

end
