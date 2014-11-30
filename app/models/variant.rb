class Variant < ActiveRecord::Base
  belongs_to :product

  enum weight_uom: [ :"Pound (lb)", :"Ounce (oz)", :"Kilogram (kg)", :"Gram (g)" ]

end