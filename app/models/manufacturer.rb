class Manufacturer < ActiveRecord::Base
  has_many :devices
end
