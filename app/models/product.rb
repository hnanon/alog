class Product < ActiveRecord::Base
  belongs_to :type
  belongs_to :device
  has_many :options, through: :product_options

  accepts_nested_attributes_for :options, allow_destroy: true

end
