class Device < ActiveRecord::Base
  belongs_to :manufacturer
  belongs_to :carrier
end
