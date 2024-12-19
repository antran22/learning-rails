require "test_helper"

class DishesControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_out
    @chung_cake = dishes(:chung_cake)
    @user_john = users(:john)
  end

  test "should get index" do
    assert_not logged_in?, "should be able to get index without authentication"
    get dishes_url
    assert_response :success
  end

  test "should show dish" do
    assert_not logged_in?, "should be able to get index without authentication"
    get dish_url(@chung_cake)
    assert_response :success
  end

  test "should get new" do
    log_in_as @user_john
    assert logged_in?
    get new_dish_url
    assert_response :success
  end

  test "should create dish" do
    log_in_as @user_john
    assert logged_in?
    assert_difference("Dish.count") do
      post dishes_url,
           params: {
             dish: {
               name: "Chung Cake",
               image: file_fixture_upload("image-1.png", "image/png"),
               description: lorem_ipsum
             }
           }
    end
    assert flash[:notice].present?, "there should be a notice"
    assert_redirected_to dish_url(Dish.last)
  end

  test "should get edit" do
    log_in_as @user_john
    get edit_dish_url(@chung_cake)
    assert_response :success
  end

  test "should update dish" do
    log_in_as @user_john
    patch dish_url(@chung_cake),
          params: {
            dish: {
              name: "Banh Chung",
              description: "A traditional food of Vietnamese"
            }
          }
    assert_redirected_to dish_url(@chung_cake)
  end

  test "should destroy dish" do
    log_in_as @user_john
    assert_difference("Dish.count", -1) { delete dish_url(@chung_cake) }

    assert_redirected_to dishes_url
  end
end
