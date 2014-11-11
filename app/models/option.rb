class Option < ActiveRecord::Base
  has_many :variants
  has_many :products, through: :product_options
  has_many :prduct_options

  accepts_nested_attributes_for :variants, allow_destroy: true

end
