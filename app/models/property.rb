class Property < ApplicationRecord
  has_many :closet_stations, dependent: :destroy
  accepts_nested_attributes_for :closet_stations
end
