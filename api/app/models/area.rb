class Area < ApplicationRecord
  has_many :dealer_areas, dependent: :destroy
  has_many :dealers, through: :dealer_areas
end
