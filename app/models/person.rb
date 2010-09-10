class Person < ActiveRecord::Base
  include RestfulX::UUIDHelper
  
  has_many :addresses, :dependent => :destroy, :as => :owner
end
