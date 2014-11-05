class Order < ActiveRecord::Base
  belongs_to :location
  belongs_to :vendor
  has_many :line_items

  accepts_nested_attributes_for :line_items
end
