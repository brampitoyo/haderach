class Manager < ActiveRecord::Base
  has_many  :universes
  
  has_many  :universe_managers
  has_many  :helped, :through => :universe_managers
end
