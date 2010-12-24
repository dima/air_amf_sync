class Location < ActiveRecord::Base
  include RestfulX::UUIDHelper
  belongs_to :address
end
