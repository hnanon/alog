class ProductOption < ActiveRecord::Base
  belongs_to :product
  belongs_to :option

  accepts_nested_attributes_for :option

end
