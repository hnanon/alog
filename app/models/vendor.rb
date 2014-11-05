class Vendor < ActiveRecord::Base
  has_many :orders
  has_many :locations, through: :orders
end
