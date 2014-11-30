class Product < ActiveRecord::Base
  belongs_to :type
  belongs_to :device

  has_many :variants
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  accepts_nested_attributes_for :variants, allow_destroy: true

  private

  #Ensure that there are no line items referencing this product.
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, "Line items present")
      return false
    end
  end

end
