class Dish < ApplicationRecord
  include ActionText::Attachable

  has_one_attached :image
  has_rich_text :description
end
