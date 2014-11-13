class ProductOption < ActiveRecord::Base
  belongs_to :product
  belongs_to :option

  has_many :variants, through: :option
  accepts_nested_attributes_for :variants

  #def variants
  #	return option.variants
  #end

  #def variants=(params)
  #	Rails.logger.info "Option Variants params: #{params}"
  #end

end
