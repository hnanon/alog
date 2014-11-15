class Option < ActiveRecord::Base
  has_many :variants
  has_many :products, through: :product_options
  has_many :product_options

  accepts_nested_attributes_for :variants, allow_destroy: true

end
