class Location < ActiveRecord::Base
  has_many :orders
  has_many :vendors, through: :orders
end
