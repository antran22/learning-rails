require "application_system_test_case"

class DishesTest < ApplicationSystemTestCase
  setup { @dish = dishes(:chung_cake) }

  test "visiting the index" do
    visit dishes_url
    assert_selector "h1", text: "Dishes"
  end

  test "should create dish" do
    visit dishes_url
    click_on "New dish"

    click_on "Create Dish"

    assert_text "Dish was successfully created"
    click_on "Back"
  end

  test "should update Dish" do
    visit dish_url(@dish)
    click_on "Edit this dish", match: :first

    click_on "Update Dish"

    assert_text "Dish was successfully updated"
    click_on "Back"
  end

  test "should destroy Dish" do
    visit dish_url(@dish)
    click_on "Destroy this dish", match: :first

    assert_text "Dish was successfully destroyed"
  end
end
