# frozen_string_literal: true

class Dealer < ActiveRecord::Base
  has_many :dealer_areas, dependent: :destroy
  has_many :areas, through: :dealer_areas
  # has_many :dealer_skills, through: :dealer_skills
end
