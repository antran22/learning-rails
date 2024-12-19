require "test_helper"

class DishTest < ActiveSupport::TestCase
  test "should create simple dish" do
    image =
      Rack::Test::UploadedFile.new(
        File.join(
          ActionDispatch::IntegrationTest.file_fixture_path,
          "image-1.png"
        ),
        "image/png"
      )
    dish = Dish.new name: "hello", image: image, description: "<div>Hello</div>"
    assert dish.valid?
    assert dish.save
  end

  test "test with attachment" do
    dish = dishes(:chung_cake)
    image = dish.image

    assert image.attached?
    assert_not_nil image.download
  end
end
