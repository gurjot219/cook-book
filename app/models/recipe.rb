class Recipe < ActiveRecord::Base

  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients

  validates :name, :instructions, :cooking_time, presence: true
  validates :name, length: { maximum: 100 }
  validates :instructions, length: { maximum: 1000 }
  validates :cooking_time, numericality: { other_than: 0 }


  # TODO: Implement
end
