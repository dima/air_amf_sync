class Address < ActiveRecord::Base
  include RestfulX::UUIDHelper
  belongs_to :business
end
